package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.ProductoBean;
import com.swaca.model.Producto;
import com.swaca.model.Proveedor;

@Service
public class productoDaoImplement implements productoDao{

	@PersistenceContext 
	EntityManager em;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ProductoBean> listDatosProducto() {
		List<Producto> producto = new ArrayList<Producto>();
		List<ProductoBean> listproductos = new ArrayList<ProductoBean>();
		String querySQL = "SELECT e FROM Producto e";
		Query query = em.createQuery(querySQL);
		producto = query.getResultList();
		
		for(int i=0;i<producto.size();i++){
			ProductoBean productoBean = new ProductoBean();
			//productoBean.setIdProveedor(producto.get(i).getIdProveedor().getNombreComercial());
			productoBean.setIdCategoria(producto.get(i).getIdCategoria().getDescripcionCategoria());
			productoBean.setBanda(producto.get(i).getBanda());
			productoBean.setColor(producto.get(i).getColor());
			productoBean.setIdMarca(producto.get(i).getIdMarca().getDescripcionMarca());
			productoBean.setIdProducto(producto.get(i).getIdProducto());
			String modelo = producto.get(i).getModelo()+" - "+producto.get(i).getTipo();
			productoBean.setModelo(modelo);
			String nombreList = producto.get(i).getIdMarca().getDescripcionMarca()+" "+modelo+" "+producto.get(i).getColor()+" "+producto.get(i).getBanda();
			productoBean.setNombreLista(nombreList);
			listproductos.add(productoBean);
		}
		
		return listproductos;
	}
	
	@Transactional
	public ProductoBean getByidProducto(int idProducto) {
		ProductoBean producto = new ProductoBean();
		Producto productoM = new Producto();
		String querySQL = "SELECT e FROM Producto e where e.idProducto="+idProducto;
		Query query = em.createQuery(querySQL);
		productoM = (Producto)query.getSingleResult();
		producto.setIdProducto(producto.getIdProducto());
		producto.setBanda(productoM.getBanda());
		producto.setColor(productoM.getColor());
		producto.setModelo(productoM.getModelo());
		producto.setIdMarca(productoM.getIdMarca().getDescripcionMarca());
		producto.setIdCategoria(productoM.getIdCategoria().getDescripcionCategoria());
		producto.setIdProveedor(productoM.getIdProveedor().getNombreComercial());
		producto.setNombreLista(productoM.getIdMarca().getDescripcionMarca()+" "+productoM.getModelo()+" "+producto.getColor()+" "+producto.getBanda());
		
		return producto;
	}

	
}
 