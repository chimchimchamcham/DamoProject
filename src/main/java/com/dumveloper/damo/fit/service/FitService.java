package com.dumveloper.damo.fit.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
