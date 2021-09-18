package com.dumveloper.damo.fit.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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

	public ModelAndView fitWrite(HashMap<String, String> params, MultipartHttpServletRequest mtfRequest, HttpSession session) {
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
		
		for (MultipartFile mf : fileList) { //파일들을 하나씩 업로드 한다
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
		
		//(3) 동영상 저장
		
		String url = params.get("url");
		logger.info("url : "+url);
		int urlUploadSuccess = fitdao.upload(dto.getKi_no(),url,"N","Y");// 동영상url을 DB에 저장
		logger.info("urlUploadSuccess : {}",urlUploadSuccess);
		
		//ModelAndView
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:fitMain");
		return mav;
	}
	
	
}
