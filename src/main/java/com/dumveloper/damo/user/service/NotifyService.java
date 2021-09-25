package com.dumveloper.damo.user.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dumveloper.damo.dto.DamoDTO;
import com.dumveloper.damo.user.dao.NotifyDAO;

@Service
public class NotifyService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired NotifyDAO notifydao;
	
	public String userNotify(HashMap<String, String> params) {
		DamoDTO dto = new DamoDTO();
		String n1_code = params.get("n1_code");
		dto.setN1_code(n1_code);
		String n2_code = params.get("n2_code");
		dto.setN2_code(n2_code);
		String n_sendid = params.get("n_sendid");
		dto.setN_sendid(n_sendid);
		String n_receiveid = params.get("n_receiveid");
		dto.setN_receiveid(n_receiveid);
		String n_content = params.get("n_content");
		dto.setN_content(n_content);
		
		int success = notifydao.userNotify(dto);
		String msg = "failed";
		if(success>0) {
			msg="success";
		}

		return msg;
	}

}
