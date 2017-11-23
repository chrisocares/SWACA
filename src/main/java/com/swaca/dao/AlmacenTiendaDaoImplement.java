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
import com.swaca.model.AlmacenTienda;
import com.swaca.model.Proveedor;

@Service
public class AlmacenTiendaDaoImplement implements AlmacenTiendaDao{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	@Override
	public AlmacenTienda createAlmacen(AlmacenTienda obj) {
		
		obj.setCantidadRegistrada(obj.getCantidadRegistrada());
		//sobj.setFecha(obj.getFecha());
		obj.setIdDetalle(obj.getIdDetalle());
		obj.setIdTienda(obj.getIdTienda());
		em.persist(obj);
		return obj;
	}

	@Transactional
	@Override
	public void UpdateAlmacen(String idDetalle, String cantidad) {
		String sql = "UPDATE AlmacenTienda a set a.cantidadRegistrada="+cantidad+" WHERE a.idDetalle="+idDetalle;
		Query query = em.createQuery(sql);
		query.executeUpdate();
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
	public List<almacenTiendaBean> listAlmacen(String estado) {
		List<AlmacenTienda> almacenTienda = new ArrayList<AlmacenTienda>();
		List<almacenTiendaBean> listalmacenTienda = new ArrayList<almacenTiendaBean>();
		System.out.print("##"+estado);
		String querySQL = "SELECT e FROM AlmacenTienda e WHERE e.estado='"+estado+"'";
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

}
