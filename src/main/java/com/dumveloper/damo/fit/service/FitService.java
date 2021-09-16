package com.dumveloper.damo.fit.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
