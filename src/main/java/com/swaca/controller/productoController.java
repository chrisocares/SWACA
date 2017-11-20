package com.swaca.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.bean.ProductoBean;
import com.swaca.dao.productoDao;

@Controller
public class productoController {
	
	@Autowired
	productoDao productodao;
	
	@RequestMapping(value="getProductos" , method = RequestMethod.POST)
	@ResponseBody
	public List<ProductoBean>  getProductos(){
		List<ProductoBean> listProducto = new ArrayList<ProductoBean>();
		listProducto = productodao.listDatosProducto();
		return listProducto;
	}
	
	@RequestMapping(value="getByidProducto-{idProducto}" , method = RequestMethod.POST)
	@ResponseBody
	public ProductoBean getByidProducto(@PathVariable("idProducto")Integer idProducto){
		ProductoBean producto = new ProductoBean();
		producto = productodao.getByidProducto(idProducto);
		return producto;
	}
}
