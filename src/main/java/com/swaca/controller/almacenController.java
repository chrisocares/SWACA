package com.swaca.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.bean.ProveedorBean;
import com.swaca.bean.almacenTiendaBean;
import com.swaca.dao.AlmacenTiendaDao;
import com.swaca.model.AlmacenTienda;

@Controller
public class almacenController {

	@RequestMapping("toAlmacen")
	public String tosolicitudCompra(){
		return "Administrador/miAlmacen";
	}
	
	@Autowired
	private AlmacenTiendaDao almacenDao;
	
	@RequestMapping(value = "crearAlmacen-{cantidadR}-{idDetalle}-{idTienda}" , method = RequestMethod.POST)
	public void crearAlmacen (@PathVariable("cantidadR") String cantidadR , @PathVariable("idDetalle") String idDetalle , @PathVariable("idTienda") String idTienda){
		AlmacenTienda obj = new AlmacenTienda();
		obj.setCantidadRegistrada(cantidadR);
		obj.setIdTienda(idTienda);
		obj.setIdDetalle(idDetalle);
		almacenDao.createAlmacen(obj);
	}
	
	@RequestMapping(value = "validarExiste-{idDetalle}" , method = RequestMethod.POST)
	@ResponseBody
	public String validarExiste (@PathVariable("idDetalle") String idDetalle){
		String existe = almacenDao.existeRegistro(idDetalle);
		return existe;
	}
	
	@RequestMapping(value= "updateAlmacen-{idDetalle}-{cantidad}" , method = RequestMethod.POST)
	public void updateAlmacen (@PathVariable("idDetalle") String idDetalle , @PathVariable("cantidad")String cantidad){
		almacenDao.UpdateAlmacen(idDetalle, cantidad);
	}
	
	@RequestMapping(value= "getList-{estado}" , method = RequestMethod.POST)
	@ResponseBody
	public List<almacenTiendaBean> getListProveedor (@PathVariable("estado")String estado){
		List<almacenTiendaBean> list = new ArrayList<almacenTiendaBean>();
		list = almacenDao.listAlmacen(estado);
		return list;
	}
}
