package com.swaca.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.dao.DetallexOrdenDao;
import com.swaca.model.OrdenCompra;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.detalleXorden;
import com.swaca.util.ParseStringToDate;

@Controller
public class detallexOrdenController {
	
	ParseStringToDate parseSTD = new ParseStringToDate();
	@Autowired
	private DetallexOrdenDao detallexordenDao;
	
	@RequestMapping(value="createDetallexOrden-{idDetalle}-{fechaEmitida}-{idOrdenCompra}-{precio}", method = RequestMethod.POST)
	@ResponseBody
	public void createDetallexOrden(@PathVariable("idDetalle") String idDetalle ,@PathVariable("fechaEmitida") String fechaEmitida,
			@PathVariable("idOrdenCompra") String idOrdenCompra ,@PathVariable("precio") String precio ){
		detalleXorden detallexorden = new detalleXorden();
		detalleSolicitudCompra detalleSolicitud = new detalleSolicitudCompra(); 
		System.out.println("////"+idDetalle);
		detalleSolicitud.setIdDetalleSolicitudCompra(Integer.parseInt(idDetalle));
		detallexorden.setDetallecompra(detalleSolicitud);
		String fechaC = fechaEmitida.replaceAll("&","-");
		detallexorden.setFechaEmitida(parseSTD.parseD(fechaC));
		OrdenCompra orden = new OrdenCompra();
		orden.setIdOrdenCompra(Integer.parseInt(idOrdenCompra));
		detallexorden.setOrdenCompra(orden);
		detallexorden.setPrecio(Double.parseDouble(precio));
		detallexordenDao.createrDetallexOrden(detallexorden);
	}
	
	@RequestMapping(value="getListaDetallexOrden-{idOrden}" , method = RequestMethod.POST)
	@ResponseBody
	public List<detalleSolicitudCompraBean>  getListaDetallexOrden(@PathVariable("idOrden") String idOrden){
		List<detalleSolicitudCompraBean> listSolicitudes = new ArrayList<detalleSolicitudCompraBean>();
		listSolicitudes = detallexordenDao.getDetalleByIdOrden(idOrden);
		return listSolicitudes;
	}
}
