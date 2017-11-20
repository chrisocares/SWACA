package com.swaca.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.swaca.bean.SolicitudCompraBean;
import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.dao.solicitudCompraDao;
import com.swaca.model.SolicitudCompra;
import com.swaca.model.Usuario;
import com.swaca.util.ParseStringToDate;

@Controller
public class solicitudCompraController {
	ParseStringToDate parseSTD = new ParseStringToDate();
	@Autowired
	solicitudCompraDao solicitudcompraDao;
	
	@RequestMapping("tosolicitudCompra")
	public String tosolicitudCompra(){
		return "Administrador/solicitudCompra";
	}
	
	@RequestMapping("toAdministrarSolicitudCompra")
	public String toAdministrarSolicitudCompra(){
		return "Almacen/administrarSolicitudCompra";
	}
	
	@RequestMapping(value="getNumeroSolicitud" , method = RequestMethod.POST)
	@ResponseBody
	public Integer getNumeroSolicitud(){
		String cadena = solicitudcompraDao.getnumeroSolicitud();
		Integer numeroSolicitud = Integer.parseInt(cadena)+1;
		return numeroSolicitud;
	}
	
	@RequestMapping(value = "createSolicitud-{descripcion}-{fechaEntrega}-{fechaRegistro}-{codTienda}-{idUsuario}" , method = RequestMethod.POST)
	@ResponseBody
	public String createSolicitud(@PathVariable("descripcion") String descripcion ,
			@PathVariable("fechaEntrega") String fechaEntrega , @PathVariable("fechaRegistro") String fechaRegistro ,
			@PathVariable("codTienda") Integer codTienda ,@PathVariable("idUsuario") Integer idUsuario ,
			HttpServletRequest request , HttpSession session, Model model){
		SolicitudCompra solicitud = new SolicitudCompra();
		Usuario usuario = new Usuario();
		solicitud.setDescripcion(descripcion);
		String fechaEntregaa = fechaEntrega.replaceAll("&","-");
		String fechaRegistroo = fechaRegistro.replaceAll("&","-");
		solicitud.setFechaEntrega(parseSTD.parseD(fechaEntregaa));
		solicitud.setFechaRegistro(parseSTD.parseD(fechaRegistroo));
		solicitud.setCodigoTiendaSolicitud(codTienda);
		usuario.setIdUsuario(idUsuario);
		solicitud.setIdUsuario(usuario);
		solicitudcompraDao.createSolicitud(solicitud);
		return "redirect:tosolicitudCompra";
	}
	
	@RequestMapping(value="getSolicitudesCompra-{idEstado}" , method = RequestMethod.POST)
	@ResponseBody
	public List<SolicitudCompraBean>  getSolicitudes(@PathVariable("idEstado") String idEstado){
		List<SolicitudCompraBean> listSolicitudes = new ArrayList<SolicitudCompraBean>();
		listSolicitudes = solicitudcompraDao.listSolicitudes(idEstado);
		return listSolicitudes;
	}
	
	@RequestMapping(value="getSolicitudesComprabyTienda-{idTienda}-{estado}" , method = RequestMethod.POST)
	@ResponseBody
	public List<SolicitudCompraBean>  getSolicitudesbyTienda(@PathVariable("idTienda") String idTienda,@PathVariable("estado") String estado){
		List<SolicitudCompraBean> listSolicitudes = new ArrayList<SolicitudCompraBean>();
		listSolicitudes = solicitudcompraDao.listSolicitudesbyTienda(idTienda,estado);
		return listSolicitudes;
	}
	
	@RequestMapping(value="updateEstadoSolicitud-{idSolicitud}-{idEstado}" , method = RequestMethod.POST)
	public void updateEstadoDetalleS (@PathVariable("idSolicitud") Integer idDetalle , @PathVariable("idEstado")Integer idEstado){
		solicitudcompraDao.updateEstado(idDetalle, idEstado);
	}
}
