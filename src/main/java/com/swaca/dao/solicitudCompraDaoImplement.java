package com.swaca.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.SolicitudCompraBean;
import com.swaca.model.SolicitudCompra;
import com.swaca.model.Usuario;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.estadoSolicitudCompra;
import com.swaca.util.DateTimeUtil;

@Service
public class solicitudCompraDaoImplement implements solicitudCompraDao{

	@PersistenceContext 
	EntityManager em;
	
	DateTimeUtil convertDATE = new DateTimeUtil();
	
	@Transactional
	@Override
	public String getnumeroSolicitud() {
		String querySQL = "SELECT MAX(e.idSolicitudCompra) FROM SolicitudCompra e";
		Query query = em.createQuery(querySQL);
		String numeroSolicitud = (String)query.getSingleResult().toString();
		return numeroSolicitud;
	}

	@Transactional
	@Override
	public SolicitudCompra createSolicitud(SolicitudCompra solicitudCompra) {
		estadoSolicitudCompra estado = new estadoSolicitudCompra();
		Usuario usuario = new Usuario();
		estado.setIdEstado(1);
		solicitudCompra.setCodigoTiendaSolicitud(solicitudCompra.getCodigoTiendaSolicitud());
		solicitudCompra.setDescripcion(solicitudCompra.getDescripcion());
		solicitudCompra.setFechaEntrega(solicitudCompra.getFechaEntrega());
		solicitudCompra.setFechaRegistro(solicitudCompra.getFechaRegistro());
		solicitudCompra.setEstado(estado);
		solicitudCompra.setIdUsuario(solicitudCompra.getIdUsuario());

		em.persist(solicitudCompra);
		return solicitudCompra;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<SolicitudCompraBean> listSolicitudes(String idEstado) {
		List<SolicitudCompra> solicitud = new ArrayList<SolicitudCompra>();
		List<SolicitudCompraBean> listsolicitud = new ArrayList<SolicitudCompraBean>();
		String querySQL = "SELECT e FROM SolicitudCompra e JOIN e.estado a WHERE a.idEstado="+idEstado;
		Query query = em.createQuery(querySQL);
		solicitud = query.getResultList();
		for(int i=0;i<solicitud.size();i++){
			SolicitudCompraBean solicitudBean = new SolicitudCompraBean();
			solicitudBean.setDescripcion(solicitud.get(i).getDescripcion());
			solicitudBean.setIdSolicitudCompra(solicitud.get(i).getIdSolicitudCompra());
			String dateTime = convertDATE.dateTimeMYSQL(solicitud.get(i).getFechaRegistro());
			solicitudBean.setFechaRegistro1(dateTime);
			String dateFechaEntrega = convertDATE.dateTimeMYSQL(solicitud.get(i).getFechaEntrega());
			solicitudBean.setFechaEntrega(dateFechaEntrega);
			solicitudBean.setDescripcionEstado(solicitud.get(i).getEstado().getDescripcion());
			solicitudBean.setDescripcionTienda(solicitud.get(i).getIdUsuario().getIdTienda().getDescripcion());
			listsolicitud.add(solicitudBean);
		}
		
		return listsolicitud;
	}

	@Transactional
	@Override
	public void updateEstado(Integer idSolicitud, Integer idEstado) {
		SolicitudCompra solicitud = new SolicitudCompra(); 
		if(idEstado == 3){
			String sql1 = "UPDATE SolicitudCompra set estado="+idEstado.toString()+" where idSolicitudCompra="+idSolicitud.toString();
			String sql2 = "UPDATE detalleSolicitudCompra e set e.estado=7 where idSolicitudCompra="+idSolicitud.toString();
			Query query1 = em.createQuery(sql1);
			Query query2 = em.createQuery(sql2);
			query1.executeUpdate();
			query2.executeUpdate();
		}else{
			String sql = "UPDATE SolicitudCompra set estado="+idEstado.toString()+" where idSolicitudCompra="+idSolicitud.toString();
			Query query = em.createQuery(sql);
			query.executeUpdate();
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SolicitudCompraBean> listSolicitudesbyTienda(String idTienda,String estado) {
		List<SolicitudCompra> solicitud = new ArrayList<SolicitudCompra>();
		List<SolicitudCompraBean> listsolicitud = new ArrayList<SolicitudCompraBean>();
		String querySQL = "SELECT e FROM SolicitudCompra e JOIN e.estado a where e.codigoTiendaSolicitud="+idTienda+" AND a.idEstado="+estado;
		Query query = em.createQuery(querySQL);
		solicitud = query.getResultList();
		
		for(int i=0;i<solicitud.size();i++){
			SolicitudCompraBean solicitudBean = new SolicitudCompraBean();
			solicitudBean.setDescripcion(solicitud.get(i).getDescripcion());
			solicitudBean.setIdSolicitudCompra(solicitud.get(i).getIdSolicitudCompra());
			String dateFechaRegistro = convertDATE.dateTimeMYSQL(solicitud.get(i).getFechaRegistro());
			solicitudBean.setFechaRegistro(dateFechaRegistro);
			String dateFechaEntrega = convertDATE.dateTimeMYSQL(solicitud.get(i).getFechaEntrega());
			solicitudBean.setFechaEntrega(dateFechaEntrega);
			solicitudBean.setDescripcionEstado(solicitud.get(i).getEstado().getDescripcion());
			solicitudBean.setDescripcionTienda(solicitud.get(i).getIdUsuario().getIdTienda().getDescripcion());
			listsolicitud.add(solicitudBean);
		}
		
		return listsolicitud;
	}

}
