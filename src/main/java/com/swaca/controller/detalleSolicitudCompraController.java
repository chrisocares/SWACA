package com.swaca.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.swaca.bean.ProductoBean;
import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.dao.detalleSolicitudCompraDao;
import com.swaca.model.Producto;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.util.ParseStringToDate;

@Controller
public class detalleSolicitudCompraController {

	ParseStringToDate parseSTD = new ParseStringToDate();
	@Autowired
	detalleSolicitudCompraDao detalleDao;
	
	@RequestMapping(value = "createDetalle-{cantidad}-{descripcion}-{fecha}-{idProducto}-{idSolicitud}" , method = RequestMethod.POST)
	@ResponseBody
	public String createSolicitud(@PathVariable("cantidad") String cantidad ,
			@PathVariable("descripcion") String descripcion , @PathVariable("fecha") String fecha ,
			@PathVariable("idProducto") String idProducto , @PathVariable("idSolicitud") String idSolicitud ,
			HttpServletRequest request , HttpSession session, Model model){
		detalleSolicitudCompra detalle = new detalleSolicitudCompra();
		Producto producto = new Producto();
		
		detalle.setCantidad(Integer.parseInt(cantidad));
		detalle.setDescripcion(descripcion);
		String fechaC = fecha.replaceAll("&","-");
		detalle.setFechaRegistro(parseSTD.parseD(fechaC));
		detalleDao.createDetalle(detalle, Integer.parseInt(idSolicitud),Integer.parseInt(idProducto));
		return "redirect:tosolicitudCompra";
	}
	
	@RequestMapping(value="getSolicitudes" , method = RequestMethod.POST)
	@ResponseBody
	public List<detalleSolicitudCompraBean>  getSolicitudes(){
		List<detalleSolicitudCompraBean> listSolicitudes = new ArrayList<detalleSolicitudCompraBean>();
		listSolicitudes = detalleDao.listSolicitudes();
		return listSolicitudes;
	}
	
	@RequestMapping(value="getSolicitudesbyProveedor-{idProveedor}" , method = RequestMethod.POST)
	@ResponseBody
	public List<detalleSolicitudCompraBean>  getSolicitudesByProveedor(@PathVariable("idProveedor") Integer idProveedor){
		List<detalleSolicitudCompraBean> listSolicitudes = new ArrayList<detalleSolicitudCompraBean>();
		listSolicitudes = detalleDao.listSolicitudesbyProveedor(idProveedor);
		return listSolicitudes;
	}
	
	@RequestMapping(value="getSolicitudesbySolicitud-{idSolicitud}" , method = RequestMethod.POST)
	@ResponseBody
	public List<detalleSolicitudCompraBean>  listSolicitudesbySolicitud(@PathVariable("idSolicitud") Integer idSolicitud){
		List<detalleSolicitudCompraBean> listSolicitudes = new ArrayList<detalleSolicitudCompraBean>();
		listSolicitudes = detalleDao.listSolicitudesbySolicitud(idSolicitud);
		return listSolicitudes;
	}
	
	@RequestMapping(value="getByIdDetalleSolicitud-{idDetalleSolicitud}" , method = RequestMethod.POST)
	@ResponseBody
	public detalleSolicitudCompraBean getByidProducto(@PathVariable("idDetalleSolicitud")Integer idDetalleSolicitud){
		detalleSolicitudCompraBean detalleSolicitudBean = new detalleSolicitudCompraBean();
		detalleSolicitudBean = detalleDao.getByIdDetalleSolicitud(idDetalleSolicitud);
		return detalleSolicitudBean;
	}
	
	@RequestMapping(value="updateCantidadDetalle-{idSolicitudDetalle}-{cantidad}" , method = RequestMethod.POST)
	public void updateCantidad (@PathVariable("idSolicitudDetalle") Integer idDetalle , @PathVariable("cantidad")Integer cantidad){
		detalleDao.updateCantidad(idDetalle, cantidad);
	}
	
	@RequestMapping(value="updateCantidadRegistradaDetalle-{idSolicitudDetalle}-{cantidad}" , method = RequestMethod.POST)
	public void updateCantidadRegistrada (@PathVariable("idSolicitudDetalle") Integer idDetalle , @PathVariable("cantidad")Integer cantidad){
		detalleDao.updateCantidadRegistrada(idDetalle, cantidad);
	}
	
	@RequestMapping(value="updateEstadoDetalle-{idSolicitudDetalle}-{idEstado}" , method = RequestMethod.POST)
	public void updateEstadoDetalleS (@PathVariable("idSolicitudDetalle") Integer idDetalle , @PathVariable("idEstado")Integer idEstado){
		detalleDao.updateEstado(idDetalle, idEstado);
	}

}
