package com.swaca.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swaca.dao.usuarioDao;
import com.swaca.model.Usuario;

@Controller
public class usuarioController {
	
	@Autowired
	private usuarioDao usuarioDaoo;
	
	@RequestMapping("toLogin")
	public String toLogin(){
		return "login";
	}
	@RequestMapping("toMenuPrincipalAdmin")
	public String toMenuPrincipal(){
		return "Administrador/menuPrincipalAdministrador";
	}
	
	@RequestMapping("toMenuPrincipalAlmacen")
	public String toMenuPrincipalAlmacen(){
		return "Almacen/menuPrincipalAlmacen";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String welcome(@ModelAttribute Usuario usuario, HttpServletRequest request, HttpSession session, Model model){
		String urlPerfil = "";
		String sinPerfil="Sin Rol";
		String Vendedor = "Vendedor";
		String EncargadoAlmacen = "Almacen";
		String AdministradorTienda = "Administrador";
		String Gerente = "Gerente";
		
		if(usuarioDaoo.login(usuario, Vendedor,request.getSession())) {
			urlPerfil = "principal/pantallaPrincipalVendedor";
		}
		else if(usuarioDaoo.login(usuario, sinPerfil,request.getSession())){
			model.addAttribute("msg", "Esta cuenta no tiene permisos de acceso.");
			urlPerfil = "login";
		}
		else if(usuarioDaoo.login(usuario, EncargadoAlmacen,request.getSession())) {
			urlPerfil = "Almacen/menuPrincipalAlmacen";
		}
		else if(usuarioDaoo.login(usuario, AdministradorTienda,request.getSession())) {
			urlPerfil = "Administrador/menuPrincipalAdministrador";
		}
		else if(usuarioDaoo.login(usuario, Gerente,request.getSession())) {
			urlPerfil = "principal/menuPrincipal";
		}
		else{
			model.addAttribute("msg", "Estos datos no son correctos.");
			urlPerfil = "login";
		}
		return urlPerfil;
	}
}
