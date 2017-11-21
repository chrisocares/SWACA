package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.SolicitudCompraBean;
import com.swaca.bean.ordenCompraBean;
import com.swaca.model.OrdenCompra;
import com.swaca.model.SolicitudCompra;
import com.swaca.util.DateTimeUtil;

@Service
public class ordenCompraDaoImplement implements ordenCompraDao{
	
	@PersistenceContext
	private EntityManager em;

	DateTimeUtil convertDATE = new DateTimeUtil();
	
	@Transactional
	@Override
	public OrdenCompra createOrden(OrdenCompra orden) {
		
		orden.setDireccionEntrega(orden.getDireccionEntrega());
		orden.setFechaEmitida(orden.getFechaEmitida());
		orden.setIdUsuario(orden.getIdUsuario());
		orden.setIGV(orden.getIGV());
		orden.setObservaciones(orden.getObservaciones());
		orden.setSubtotal(orden.getSubtotal());
		orden.setTotal(orden.getTotal());
		
		em.persist(orden);
		return orden;
	}

	@Transactional
	@Override
	public ordenCompraBean getOrden(String idOrden, HttpSession session) {
		String QuerySQL = "SELECT e FROM OrdenCompra e WHERE e.idOrdenCompra="+idOrden;
		Query query = em.createQuery(QuerySQL);
		ordenCompraBean ordenBean = new ordenCompraBean();
		OrdenCompra ordenCompra = new OrdenCompra();
		ordenCompra = (OrdenCompra)query.getSingleResult();
		ordenBean.setDireccionEntrega(ordenCompra.getDireccionEntrega());
		ordenBean.setFechaEmitida(ordenCompra.getFechaEmitida());
		ordenBean.setIdOrdenCompra(ordenCompra.getIdOrdenCompra());
		ordenBean.setIdUsuario(ordenCompra.getIdUsuario());
		ordenBean.setIGV(ordenCompra.getIGV());
		ordenBean.setObservaciones(ordenCompra.getObservaciones());
		ordenBean.setSubtotal(ordenCompra.getSubtotal());
		ordenBean.setTotal(ordenCompra.getTotal());
		ordenBean.setDetallexorden(ordenCompra.getDetallexorden());
		ordenBean.setIdProveedor(ordenCompra.getIdProveedor());
		session.setAttribute("ordenCompra", ordenBean);
		return ordenBean;
	}

	@Transactional
	@Override
	public String getnumeroOrden() {
		String querySQL = "SELECT MAX(e.idOrdenCompra) FROM OrdenCompra e";
		Query query = em.createQuery(querySQL);
		String numeroSolicitud = (String)query.getSingleResult().toString();
		return numeroSolicitud;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ordenCompraBean> listOrdenesCompra(String idEstado) {
		List<OrdenCompra> ordenCompra = new ArrayList<OrdenCompra>();
		List<ordenCompraBean> listordenCompraBean = new ArrayList<ordenCompraBean>();
		String querySQL = "SELECT e FROM OrdenCompra e JOIN e.estado a WHERE a.idEstado="+idEstado;
		Query query = em.createQuery(querySQL);
		ordenCompra = query.getResultList();
		
		for(int i=0;i<ordenCompra.size();i++){
			ordenCompraBean ordencompraBean = new ordenCompraBean();
			ordencompraBean.setIdOrdenCompra(ordenCompra.get(i).getIdOrdenCompra());
			ordencompraBean.setObservaciones(ordenCompra.get(i).getObservaciones());
			String dateTime = convertDATE.dateTimeMYSQL(ordenCompra.get(i).getFechaEmitida());
			ordencompraBean.setFecha(dateTime);
			ordencompraBean.setNombreProveedor(ordenCompra.get(i).getIdProveedor().getRazonSocial());
			listordenCompraBean.add(ordencompraBean);
		}
		
		return listordenCompraBean;
	}
	
	@Transactional
	@Override
	public ordenCompraBean getOrdenbyId(String idOrden) {
		String QuerySQL = "SELECT e FROM OrdenCompra e WHERE e.idOrdenCompra="+idOrden;
		Query query = em.createQuery(QuerySQL);
		ordenCompraBean ordenBean = new ordenCompraBean();
		OrdenCompra ordenCompra = new OrdenCompra();
		ordenCompra = (OrdenCompra)query.getSingleResult();
		ordenBean.setDireccionEntrega(ordenCompra.getDireccionEntrega());
		String dateTime = convertDATE.dateTimeMYSQL(ordenCompra.getFechaEmitida());
		ordenBean.setFecha(dateTime);
		ordenBean.setIdOrdenCompra(ordenCompra.getIdOrdenCompra());
		ordenBean.setIGV(ordenCompra.getIGV());
		ordenBean.setObservaciones(ordenCompra.getObservaciones());
		ordenBean.setSubtotal(ordenCompra.getSubtotal());
		ordenBean.setTotal(ordenCompra.getTotal());
		ordenBean.setNombreProveedor(ordenCompra.getIdProveedor().getRazonSocial());
		ordenBean.setNombreestado(ordenCompra.getEstado().getDescripcion());
		ordenBean.setCorreoProveedor(ordenCompra.getIdProveedor().getEmail());
		return ordenBean;
	}
}
