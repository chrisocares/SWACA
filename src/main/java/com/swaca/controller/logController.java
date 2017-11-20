package com.swaca.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.bean.LOGoperacionesBean;
import com.swaca.dao.logDao;

@Controller
public class logController {
	
	@Autowired
	private logDao logdao;
	
	@RequestMapping(value="getLOGxDetalle-{id}" , method = RequestMethod.POST)
	@ResponseBody
	public List<LOGoperacionesBean>  getLOGxDetalle(@PathVariable("id") Integer id){
		List<LOGoperacionesBean> listLOG = new ArrayList<LOGoperacionesBean>();
		listLOG = logdao.listLOGxDetalle(id);
		return listLOG;
	}
}
