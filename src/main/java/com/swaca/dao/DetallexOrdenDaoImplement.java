package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.SolicitudCompra;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.detalleXorden;

@Service
public class DetallexOrdenDaoImplement implements DetallexOrdenDao{
	@PersistenceContext
	private EntityManager em;
	
	@Transactional
	@Override
	public detalleXorden createrDetallexOrden(detalleXorden detallexorden) {
		detallexorden.setDetallecompra(detallexorden.getDetallecompra());
		detallexorden.setFechaEmitida(detallexorden.getFechaEmitida());
		detallexorden.setOrdenCompra(detallexorden.getOrdenCompra());
		detallexorden.setPrecio(detallexorden.getPrecio());
		em.persist(detallexorden);
		return detallexorden;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<detalleSolicitudCompraBean> getDetalleByIdOrden(String idOrdenCompra) {
		List<detalleXorden> listdetallexorden = new ArrayList<detalleXorden>();
		List<detalleSolicitudCompraBean> listdetalleSolicitudBean = new ArrayList<detalleSolicitudCompraBean>();
		
		SolicitudCompra solicitudCompra = new SolicitudCompra();
		
		String sql ="SELECT e FROM detalleXorden e JOIN e.ordenCompra u WHERE u.idOrdenCompra="+idOrdenCompra;
		Query query = em.createQuery(sql);
		listdetallexorden = query.getResultList();
		
		for(int i=0;i<listdetallexorden.size();i++){
			detalleSolicitudCompraBean detalleSolicitud = new detalleSolicitudCompraBean();
			detalleSolicitud.setIdDetalleSolicitudCompra(listdetallexorden.get(i).getDetallecompra().getIdDetalleSolicitudCompra());
			detalleSolicitud.setIdSolicitud(listdetallexorden.get(i).getDetallecompra().getIdSolicitudCompra().getIdSolicitudCompra());
			detalleSolicitud.setDescripcion(listdetallexorden.get(i).getDetallecompra().getDescripcion());
			String marca = listdetallexorden.get(i).getDetallecompra().getIdProducto().getIdMarca().getDescripcionMarca();
			String modelo = listdetallexorden.get(i).getDetallecompra().getIdProducto().getModelo();
			String tipo = listdetallexorden.get(i).getDetallecompra().getIdProducto().getTipo();
			String color = listdetallexorden.get(i).getDetallecompra().getIdProducto().getColor();
			String banda = listdetallexorden.get(i).getDetallecompra().getIdProducto().getBanda();
			String nombreProducto = marca + " - " + modelo + " - " + tipo + " - " + color + " - " +banda;
			detalleSolicitud.setNombreProducto(nombreProducto);
			detalleSolicitud.setCantidad(listdetallexorden.get(i).getDetallecompra().getCantidad());
			detalleSolicitud.setFechaRegistro(listdetallexorden.get(i).getDetallecompra().getIdSolicitudCompra().getFechaEntrega());
			Double precioCompraProducto = listdetallexorden.get(i).getDetallecompra().getIdProducto().getPrecioCompra();
			Double cant = (double)listdetallexorden.get(i).getDetallecompra().getCantidad();
			Double total = precioCompraProducto * cant;
			detalleSolicitud.setPrecioTotal(total);
			detalleSolicitud.setEstado(listdetallexorden.get(i).getDetallecompra().getEstado().getDescripcion());
			listdetalleSolicitudBean.add(detalleSolicitud);
		}
		return listdetalleSolicitudBean;
	}

}
