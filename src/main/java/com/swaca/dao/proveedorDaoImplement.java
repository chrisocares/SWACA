package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.ProveedorBean;
import com.swaca.model.Proveedor;

@Service
public class proveedorDaoImplement implements proveedorDao{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	@Override
	public Proveedor createProveedor(Proveedor proveedor) {
		
		proveedor.setEstado("true");
		proveedor.setNombreComercial(proveedor.getNombreComercial());
		proveedor.setDepartamento(proveedor.getDepartamento());
		proveedor.setDireccion(proveedor.getDireccion());
		proveedor.setEmail(proveedor.getEmail());
		proveedor.setNombreContacto(proveedor.getNombreContacto());
		proveedor.setPais(proveedor.getPais());
		proveedor.setRazonSocial(proveedor.getRazonSocial());
		proveedor.setRuc(proveedor.getRuc());
		proveedor.setTelefonoContacto(proveedor.getTelefonoContacto());
		proveedor.setTratamiento(proveedor.getTratamiento());
		proveedor.setNombreComercial(proveedor.getNombreComercial());
		em.persist(proveedor);
		return proveedor;
	}

	@Transactional
	public Proveedor editProveedor(Proveedor proveedor) {
		Proveedor s = em.find(Proveedor.class, proveedor.getIdProveedor());
		Proveedor edit = em.merge(s);
		edit.setDepartamento(proveedor.getDepartamento());
		edit.setDireccion(proveedor.getDireccion());
		edit.setEmail(proveedor.getEmail());
		edit.setNombreComercial(proveedor.getNombreComercial());
		edit.setNombreContacto(proveedor.getNombreContacto());
		edit.setPais(proveedor.getPais());
		edit.setRazonSocial(proveedor.getRazonSocial());
		edit.setRuc(proveedor.getRuc());
		edit.setTelefonoContacto(proveedor.getTelefonoContacto());
		edit.setTratamiento(proveedor.getTratamiento());
		return edit;
	}

	@Transactional
	public boolean deleteProveedor(int idProveedor) {
		Proveedor obj = em.find(Proveedor.class, idProveedor);
		Proveedor edit = em.merge(obj);
		edit.setEstado("false");
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<ProveedorBean> listProveedor() {
		List<Proveedor> proveedor = new ArrayList<Proveedor>();
		List<ProveedorBean> listproveedor = new ArrayList<ProveedorBean>();
		String querySQL = "SELECT e FROM Proveedor e WHERE e.estado='true'";
		Query query = em.createQuery(querySQL);
		proveedor = query.getResultList();
		
		for(int i=0;i<proveedor.size();i++){
			ProveedorBean proveedorBean = new ProveedorBean();
			proveedorBean.setIdProveedor(proveedor.get(i).getIdProveedor());
			proveedorBean.setNombreComercial(proveedor.get(i).getNombreComercial());
			proveedorBean.setRazonSocial(proveedor.get(i).getRazonSocial());
			proveedorBean.setTratamiento(proveedor.get(i).getTratamiento());
			proveedorBean.setRuc(proveedor.get(i).getRuc());
			proveedorBean.setTelefonoContacto(proveedor.get(i).getTelefonoContacto());
			proveedorBean.setEmail(proveedor.get(i).getEmail());
			proveedorBean.setDireccion(proveedor.get(i).getDireccion());
			proveedorBean.setGrupoPago(proveedor.get(i).getGrupoPago());
			proveedorBean.setTipoMoneda(proveedor.get(i).getTipoMoneda());
			proveedorBean.setCondicionPago(proveedor.get(i).getCondicionPago());

			listproveedor.add(proveedorBean);
		}
		
		return listproveedor;
	}

	@Transactional
	public ProveedorBean getByidProveedor(Integer idProveedor) {
		Proveedor proveedor = new Proveedor();
		ProveedorBean proveedorBean = new ProveedorBean();
		String querySQL = "SELECT e FROM Proveedor e where e.idProveedor="+idProveedor.toString();
		Query query = em.createQuery(querySQL);
		proveedor = (Proveedor)query.getSingleResult();
		proveedorBean.setDepartamento(proveedor.getDepartamento());
		proveedorBean.setDireccion(proveedor.getDireccion());
		proveedorBean.setGrupoPago(proveedor.getGrupoPago());
		proveedorBean.setTipoMoneda(proveedor.getTipoMoneda());
		proveedorBean.setCondicionPago(proveedor.getCondicionPago());
		return proveedorBean;
	}

}
