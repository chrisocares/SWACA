package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.ProveedorBean;
import com.swaca.bean.almacenTiendaBean;
import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.AlmacenTienda;
import com.swaca.model.Proveedor;
import com.swaca.model.detalleSolicitudCompra;

@Service
public class AlmacenTiendaDaoImplement implements AlmacenTiendaDao{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	@Override
	public AlmacenTienda createAlmacen(AlmacenTienda obj) {
		
		obj.setCantidadRegistrada(obj.getCantidadRegistrada());
		//sobj.setFecha(obj.getFecha());
		obj.setEstado("STOCK");
		obj.setIdDetalle(obj.getIdDetalle());
		obj.setIdTienda(obj.getIdTienda());
		em.persist(obj);
		String sql = "UPDATE detalleSolicitudCompra set codigo=1 where idDetalleSolicitudCompra="+obj.getIdDetalle();
		Query query = em.createQuery(sql);
		query.executeUpdate();
		return obj;
	}

	@Transactional
	@Override
	public void UpdateAlmacen(String idDetalle, String cantidad) {
		String sql = "UPDATE AlmacenTienda a set a.cantidadRegistrada="+cantidad+" WHERE a.idDetalle="+idDetalle;
		String sql2 = "UPDATE detalleSolicitudCompra set codigo=1 where idDetalleSolicitudCompra="+idDetalle;
		Query query = em.createQuery(sql);
		Query query2 = em.createQuery(sql2);
		query.executeUpdate();
		query2.executeUpdate();
	}	
	
	@Transactional
	@Override
	public String existeRegistro(String idDetalle) {
		String sql = "SELECT COUNT(e.idDetalle) FROM AlmacenTienda e WHERE e.idDetalle="+idDetalle;
		Query query = em.createQuery(sql);
		String registro = (String)query.getSingleResult().toString();
		return registro;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<almacenTiendaBean> listAlmacen(String estado,String idTienda) {
		List<AlmacenTienda> almacenTienda = new ArrayList<AlmacenTienda>();
		List<almacenTiendaBean> listalmacenTienda = new ArrayList<almacenTiendaBean>();
		System.out.print("##"+estado);
		String querySQL = "SELECT e FROM AlmacenTienda e WHERE e.estado='"+estado+"' AND e.idTienda="+idTienda;
		Query query = em.createQuery(querySQL);
		almacenTienda = query.getResultList();
		
		for(int i=0;i<almacenTienda.size();i++){
			almacenTiendaBean almacenBean = new almacenTiendaBean();
			almacenBean.setCantidadRegistrada(almacenTienda.get(i).getCantidadRegistrada());
			almacenBean.setEstado(almacenTienda.get(i).getEstado());
			almacenBean.setIdDetalle(almacenTienda.get(i).getIdDetalle());
			almacenBean.setIdTienda(almacenTienda.get(i).getIdTienda());
			listalmacenTienda.add(almacenBean);
		}
		
		return listalmacenTienda;
	}

	@Override
	@Transactional
	public almacenTiendaBean getByIdDetalleAlmacen(Integer idDetalleSolicitud) {
		almacenTiendaBean almacenTiendaB = new almacenTiendaBean();
		AlmacenTienda almacenTienda = new AlmacenTienda();
		String querySQL = "SELECT e FROM AlmacenTienda e where e.idDetalle="+idDetalleSolicitud.toString();
		Query query = em.createQuery(querySQL);
		almacenTienda = (AlmacenTienda)query.getSingleResult();
		almacenTiendaB.setCantidadRegistrada(almacenTienda.getCantidadRegistrada());
		return almacenTiendaB;
	}	

}
