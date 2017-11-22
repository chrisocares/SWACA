package com.swaca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class almacenController {

	@RequestMapping("toAlmacen")
	public String tosolicitudCompra(){
		return "Administrador/miAlmacen";
	}
}
