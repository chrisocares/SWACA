package com.swaca.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.bean.ProveedorBean;
import com.swaca.bean.ordenCompraBean;
import com.swaca.dao.ordenCompraDao;
import com.swaca.model.OrdenCompra;
import com.swaca.model.Proveedor;
import com.swaca.model.Usuario;
import com.swaca.util.ParseStringToDate;

@Controller
public class ordenCompraController {

	@Autowired
	private ordenCompraDao ordenDao;
	
	@RequestMapping("toCrearOrdenCompra")
	public String toCrearOrdenCompra(){
		return "Almacen/crearOrdenCompra";
	}
	
	@RequestMapping("toAdministrarOrdenCompra")
	public String toAdministrarOrdenCompra(){
		return "Almacen/adminOrdenCompra";
	}
	
	ParseStringToDate parseSTD = new ParseStringToDate();
	
	@RequestMapping(value="createOrdenCompra-{direccionEntrega}-{fechaEmitida}-{idUsuario}-{subTotal}-{Total}-{observaciones}-{idProveedor}" , method = RequestMethod.POST)
	@ResponseBody
	public String createOrdenCompra (@PathVariable("direccionEntrega") String direccionEntrega , @PathVariable("fechaEmitida") String fechaEmitida,
			@PathVariable("idUsuario") String idUsuario , @PathVariable("subTotal") String subTotal ,@PathVariable("Total") String total, @PathVariable("observaciones") String observaciones 
			, @PathVariable("idProveedor") String idProveedor, HttpServletRequest request , HttpSession session, Model model){
		OrdenCompra orden = new OrdenCompra();
		Usuario usuario = new Usuario();
		Proveedor proveedor = new Proveedor();
		proveedor.setIdProveedor(Integer.parseInt(idProveedor));
		usuario.setIdUsuario(Integer.parseInt(idUsuario));
		orden.setDireccionEntrega(direccionEntrega);
		String fechaC = fechaEmitida.replaceAll("&","-");
		orden.setFechaEmitida(parseSTD.parseD(fechaC));
		orden.setIdUsuario(usuario);
		orden.setSubtotal(Double.parseDouble(subTotal));
		Double IGV = (Double.parseDouble(subTotal)*18)/100;
		orden.setIGV(IGV);
		orden.setTotal(Double.parseDouble(total));
		orden.setObservaciones(observaciones);
		orden.setIdProveedor(proveedor);
		ordenDao.createOrden(orden);
		return "";
	}
	
	@RequestMapping(value="viewOrdenCompra-{idOrden}", method = RequestMethod.GET)
	public String viewOrdenCompra (@PathVariable("idOrden") String idOrden , HttpServletRequest request, HttpSession session, Model model){
		ordenDao.getOrden(idOrden, request.getSession());
		
		return "redirect:toCrearOrdenCompra";
	}
	
	@RequestMapping(value="getNumeroOrden" , method = RequestMethod.POST)
	@ResponseBody
	public Integer getNumeroOrden(){
		String cadena = ordenDao.getnumeroOrden();
		Integer numeroSolicitud = Integer.parseInt(cadena)+1;
		return numeroSolicitud;
	}
	
	@RequestMapping(value="listOrdenCompra-{idEstado}", method = RequestMethod.POST)
	@ResponseBody
	public List<ordenCompraBean> listOrdenCompra (@PathVariable("idEstado")String idEstado){
		List<ordenCompraBean> ordenCompra = new ArrayList<ordenCompraBean>();
		ordenCompra = ordenDao.listOrdenesCompra(idEstado);
		return ordenCompra;
	}

	@RequestMapping(value="getOrdenCompraByID-{idOrden}" , method = RequestMethod.POST)
	@ResponseBody
	public ordenCompraBean getByidProveedor(@PathVariable("idOrden") String idOrden){
		ordenCompraBean orden = new ordenCompraBean();
		orden = ordenDao.getOrdenbyId(idOrden);
		return orden;
	}
	
	@RequestMapping(value="updateEstadoOrdenCompra-{idOrdenCompra}-{idEstado}" , method = RequestMethod.POST)
	public void updateEstadoOrdenCompra (@PathVariable("idOrdenCompra") String idOrdenCompra , @PathVariable("idEstado")String idEstado){
		ordenDao.updateEstado(idOrdenCompra, idEstado);
	}

}
