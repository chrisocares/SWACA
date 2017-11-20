package com.swaca.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.bean.ProveedorBean;
import com.swaca.dao.proveedorDao;
import com.swaca.model.Proveedor;
@Controller
public class proveedorController {
	
	@Autowired
	proveedorDao proveedorDaoo;
	
	@RequestMapping("toGestionarProveedor")
	public String toGestionarProveedor(){
		return "gestionarProveedor";
	}
	
	@RequestMapping(value = "createProveedor" , method = RequestMethod.POST)
	public String createProveedor(@ModelAttribute Proveedor proveedor , HttpServletRequest request , HttpSession session, Model model){
		proveedorDaoo.createProveedor(proveedor);
		return "redirect:toGestionarProveedor"+proveedor.getNombreComercial();
	}
	
	@RequestMapping(value="getByidProveedor-{idProveedor}" , method = RequestMethod.POST)
	@ResponseBody
	public ProveedorBean getByidProveedor(@PathVariable("idProveedor")Integer idProveedor){
		ProveedorBean proveedor = new ProveedorBean();
		proveedor = proveedorDaoo.getByidProveedor(idProveedor);
		return proveedor;
	}
	
	@RequestMapping(value= "getListProveedor" , method = RequestMethod.POST)
	@ResponseBody
	public List<ProveedorBean> getListProveedor (){
		List<ProveedorBean> listProveedor = new ArrayList<ProveedorBean>();
		listProveedor = proveedorDaoo.listProveedor();
		return listProveedor;
	}
	
	@RequestMapping(value="updateEstado-{idProveedor}" , method = RequestMethod.POST)
	@ResponseBody
	public void updateEstado(@PathVariable("idProveedor") Integer idProveedor){
		proveedorDaoo.deleteProveedor(idProveedor);
	}
	//GitC
	/*@RequestMapping(value="updateProveedor" , method = RequestMethod.POST)
	@ResponseBody
	public void updateProveedor(@ModelAttribute Proveedor proveedor , HttpServletRequest req, HttpSession session, Model model){
		System.out.print("");
		proveedorDaoo.editProveedor(proveedor);
	}*/
}
