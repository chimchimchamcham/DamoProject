package com.dumveloper.damo.fit.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dumveloper.damo.dto.DamoDTO;
import com.dumveloper.damo.fit.dao.FitDAO;

@Service
public class FitService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FitDAO fitdao;

	public HashMap<String, Object> bestFitList() {
		HashMap<String, Object> map = new HashMap<>();
		boolean success = false;
		
		map.put("list", fitdao.bestFitList());
		
		success = true;
		map.put("success", success);
		
		return map;
	}

	public HashMap<String, Object> newFitList(HashMap<String, String> params) {
		int cnt = Integer.parseInt(params.get("cnt"));
		int start = (cnt-1)*12+1;
		int end = cnt*12;
		String category = params.get("category");
		
		HashMap<String,Object> map = new HashMap<>();
		boolean success = false;
		
		ArrayList<DamoDTO> list = fitdao.newFitList(start,end,category);
		map.put("list", list);
		map.put("listSize", list.size());
		success = true;
		map.put("success", success);
		
		return map;
	}

	public ModelAndView fitWrite(HashMap<String, String> params, MultipartHttpServletRequest mtfRequest, 
			HttpSession session, List<String> imgNos, RedirectAttributes rAttr) {
		
		//(1) 아이디, 제목, 내용, 카테고리 저장
		String u_id = (String) session.getAttribute("loginId");
		String k_title = params.get("k_title");
		String k_content = params.get("k_content");
		String k_code = params.get("k_code");
		
		DamoDTO dto = new DamoDTO();
		dto.setU_id(u_id);
		dto.setK_title(k_title);
		dto.setK_content(k_content);
		dto.setK_code(k_code);
		
		int success = fitdao.fitWrite(dto);
		logger.info("success : {}",success);
		logger.info("ki_no : {}",dto.getKi_no());
		
		//(2) 이미지 저장
		
		//input파일에 있는 파일들을 가져온다
		List<MultipartFile> fileList = mtfRequest.getFiles("photo");
		String root = "C:/upload/"; //이미지를 저장할 경로
		
		logger.info("fileList.size()",fileList.size());
		
		//imgNos 크기가 1보다 클 때 이미지 업로드 실행 (이미지가 없어도 이미 0이라는 값이 존재하기 때문에)
		if(imgNos.size()>1) {
			int i = 1; //사진 index와 비교하기 위한 변수
			for (MultipartFile mf : fileList) { //파일들을 하나씩 업로드 한다
				
				//인덱스가 있어야만 사진 업로드 실행
				if(imgNos.contains(""+i)) {
					logger.info("인덱스 {} 사진 업로드",i);
					
		            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		            long fileSize = mf.getSize(); // 파일 사이즈

		            logger.info("originFileName : " + originFileName);
		            logger.info("fileSize : " + fileSize);

		            String newFileName = System.currentTimeMillis() + originFileName.substring(originFileName.lastIndexOf("."));;
		            try {
		                mf.transferTo(new File(root + newFileName)); //파일을 업로드!! 간단
		                int imgUploadSuccess = fitdao.upload(dto.getKi_no(),newFileName,"Y","Y");// 파일명을 DB에 저장
		                logger.info("imgUploadSuccess : {}",imgUploadSuccess);
		            }catch (IOException e) {
		                e.printStackTrace();
		            }
				}
			
	            i++;
	        }
		}

		//(3) 동영상 저장
		
		String url = params.get("url");
		logger.info("url : "+url);
		
		if(url != null && !url.equals("")) {
			int urlUploadSuccess = fitdao.upload(dto.getKi_no(),url,"N","Y");// 동영상url을 DB에 저장
			logger.info("urlUploadSuccess : {}",urlUploadSuccess);
		}
		//ModelAndView
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/fitMain");
		rAttr.addFlashAttribute("msg", "작성이 완료되었습니다");
		return mav;
	}

	public ModelAndView fitUpdateForm(String k_no) {
		
		ModelAndView mav = new ModelAndView();
		DamoDTO dto = fitdao.fitUpdateForm(k_no);
		logger.info("dto : {}",dto);
		mav.addObject("dto",dto);
		
		ArrayList<String> photoList = fitdao.fitImgList(k_no,"Y","Y");
		logger.info("photoList.size() : {}",photoList.size());
		if(photoList.size()>0) {
			mav.addObject("photoList",photoList);
		}
		
		ArrayList<String> url = fitdao.fitImgList(k_no,"N","Y");
		logger.info("url : {}",url);
		if(url.size()>0) {
			mav.addObject("url",url.get(0));
		}
		
		mav.setViewName("fit/fitUpdateForm");

		return mav;
	}

	public ModelAndView fitUpdate(HashMap<String, String> params, List<String> imgNos, List<MultipartFile> files,
			RedirectAttributes rAttr) {
		
		//(1) 일반 변경
		DamoDTO dto = new DamoDTO();
		String k_no = params.get("k_no");
		String k_title = params.get("k_title");
		String k_content = params.get("k_content");
		String k_code = params.get("k_code");
		
		dto.setK_no(Integer.parseInt(k_no));
		dto.setK_title(k_title);
		dto.setK_content(k_content);
		dto.setK_code(k_code);
		
		int success = fitdao.knowfitUpdate(dto);
		logger.info("success : {}",success);
		
		//(2) 사진 변경
		//사진 불러오기
		ArrayList<String> photoList = fitdao.fitImgList(k_no, "Y", "Y");
		logger.info("photoList : {}",photoList);
		
		//삭제처리
		for(String photo : photoList) {
			logger.info("photo : {}",photo);
			
			boolean deleteYN = true; //삭제여부를 Y로 세팅해둔다.
			
			for(String imgNo : imgNos) {
				if(photo.equals(imgNo)) {
					deleteYN = false; //같은 파일명이 존재해면 삭제하지 않는다.
					break;
				}
			}
			
			if(deleteYN) {
				//같은 파일명이 존재하지 않으면 삭제처리한다.
				success = fitdao.knowfitImgDelete(k_no,photo,"Y","Y");
			}
		}
		
		//업로드처리
		String root = "C:/upload/"; //이미지를 저장할 경로
		
		//List<MultipartFile> files
		if(files.size()>0) {
			for (MultipartFile mf : files) { //파일들을 하나씩 업로드 한다
					
		            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		            long fileSize = mf.getSize(); // 파일 사이즈

		            logger.info("originFileName : " + originFileName);
		            logger.info("fileSize : " + fileSize);

		            String newFileName = System.currentTimeMillis() + originFileName.substring(originFileName.lastIndexOf("."));;
		            try {
		                mf.transferTo(new File(root + newFileName)); //파일을 업로드!! 간단
		                int imgUploadSuccess = fitdao.upload(Integer.parseInt(k_no),newFileName,"Y","Y");// 파일명을 DB에 저장
		                logger.info("imgUploadSuccess : {}",imgUploadSuccess);
		            }catch (IOException e) {
		                e.printStackTrace();
		            }
	        }
		}
		//(3) URL 변경
		String url = params.get("url");
		//knowfit_img 에서 url이 존재하는지 확인
		ArrayList<String> urlList = fitdao.fitImgList(k_no, "N", "Y");
		if(url.equals("")||url == null) {
			success = fitdao.knowfitUrlDelete(k_no,"N","Y");
			logger.info("success1 : {}",success);
		}else { //url이 존재할 경우
			if(urlList.size()==0) {
				//DB에 url이 존재하지 않을 경우 insert
				success = fitdao.knowfitImgInsert(k_no,url,"N","Y");
				logger.info("success2 : {}",success);
			}else if(urlList.size()>0 && !url.equals(urlList.get(0))){
				//DB에 url이 존재하지만 일치하지 않을 경우
				success = fitdao.knowfitimgUpdate(k_no,url,"N","Y");
				logger.info("success3 : {}",success);
			}else if(urlList.size()>0 && url.equals(urlList.get(0))){
				//DB에 url이 존재gkrh 일치할 경우
				logger.info("DB데이터와 동일");
			}
			
		}
		
		ModelAndView mav = new ModelAndView();
		//상세보기가 구현되지 않았으므로 메인으로 이동처리
		//mav.setViewName("fitDetail?k_no="+k_no);
		rAttr.addFlashAttribute("msg","수정이 완료되었습니다");
		mav.setViewName("redirect:/fitMain");
		return mav;
	}

	public ModelAndView fitRanking() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", fitdao.fitRanking());
		mav.setViewName("fit/fitRanking");
		return mav;
	}

}
