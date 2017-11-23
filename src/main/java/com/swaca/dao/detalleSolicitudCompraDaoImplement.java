package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swaca.bean.ProductoBean;
import com.swaca.bean.SolicitudCompraBean;
import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.Producto;
import com.swaca.model.SolicitudCompra;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.estadoDetalleSolicitudCompra;
import com.swaca.util.DateTimeUtil;

@Service
public class detalleSolicitudCompraDaoImplement implements detalleSolicitudCompraDao{

	@PersistenceContext
	EntityManager em;
	
	DateTimeUtil convertDATE = new DateTimeUtil();

	
	@Override
	@Transactional
	public detalleSolicitudCompra createDetalle(detalleSolicitudCompra detalle , int idSolicitud , int idProducto) {
		estadoDetalleSolicitudCompra estado = new estadoDetalleSolicitudCompra();
		SolicitudCompra solicitud = new SolicitudCompra();
		Producto producto = new Producto();
		solicitud.setIdSolicitudCompra(idSolicitud);
		estado.setIdEstado(1);
		producto.setIdProducto(idProducto);
		detalle.setEstado(estado);
		detalle.setIdProducto(producto);
		detalle.setCantidad(detalle.getCantidad());
		detalle.setDescripcion(detalle.getDescripcion());
		detalle.setFechaRegistro(detalle.getFechaRegistro());
		detalle.setCantidadRegistrada(0);
		detalle.setIdProducto(producto);
		detalle.setIdSolicitudCompra(solicitud);
		
		em.persist(detalle);
		
		return detalle;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<detalleSolicitudCompraBean> listSolicitudes() {
		List<detalleSolicitudCompra> detallesolicitudCompra = new ArrayList<detalleSolicitudCompra>();
		List<detalleSolicitudCompraBean> listsolicitud = new ArrayList<detalleSolicitudCompraBean>();
		String querySQL = "SELECT e FROM detalleSolicitudCompra e ";
		Query query = em.createQuery(querySQL);
		detallesolicitudCompra = query.getResultList();
		
		for(int i=0;i<detallesolicitudCompra.size();i++){
			detalleSolicitudCompraBean detallesolicitudCompraBean = new detalleSolicitudCompraBean();
			detallesolicitudCompraBean.setDescripcion(detallesolicitudCompra.get(i).getDescripcion());
			detallesolicitudCompraBean.setIdDetalleSolicitudCompra(detallesolicitudCompra.get(i).getIdDetalleSolicitudCompra());
			String dateTime = convertDATE.dateTimeMYSQL(detallesolicitudCompra.get(i).getFechaRegistro());
			detallesolicitudCompraBean.setFecha(dateTime);
			detallesolicitudCompraBean.setEstado(detallesolicitudCompra.get(i).getEstado().getDescripcion());
			detallesolicitudCompraBean.setCantidad(detallesolicitudCompra.get(i).getIdSolicitudCompra().getIdSolicitudCompra());

			listsolicitud.add(detallesolicitudCompraBean);
		}
		
		return listsolicitud;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<detalleSolicitudCompraBean> listSolicitudesbyProveedor(Integer idProveedor) {
		List<detalleSolicitudCompra> detallesolicitudCompra = new ArrayList<detalleSolicitudCompra>();
		List<detalleSolicitudCompraBean> listsolicitud = new ArrayList<detalleSolicitudCompraBean>();
		String querySQL = "SELECT e FROM detalleSolicitudCompra e JOIN e.idProducto u JOIN e.estado a WHERE u.idProveedor="+idProveedor.toString()+" AND a.descripcion='SOLICITADO'";
		Query query = em.createQuery(querySQL);
		detallesolicitudCompra = query.getResultList();
		
		for(int i=0;i<detallesolicitudCompra.size();i++){
			detalleSolicitudCompraBean detallesolicitudCompraBean = new detalleSolicitudCompraBean();
			detallesolicitudCompraBean.setDescripcion(detallesolicitudCompra.get(i).getDescripcion());
			detallesolicitudCompraBean.setIdDetalleSolicitudCompra(detallesolicitudCompra.get(i).getIdDetalleSolicitudCompra());
			String dateTime = convertDATE.dateTimeMYSQL(detallesolicitudCompra.get(i).getFechaRegistro());
			detallesolicitudCompraBean.setFecha(dateTime);
			detallesolicitudCompraBean.setEstado(detallesolicitudCompra.get(i).getEstado().getDescripcion());
			detallesolicitudCompraBean.setCantidad(detallesolicitudCompra.get(i).getCantidad());
			detallesolicitudCompraBean.setCodigo(detallesolicitudCompra.get(i).getIdSolicitudCompra().getIdSolicitudCompra());
			String nombreProducto = detallesolicitudCompra.get(i).getIdProducto().getIdMarca().getDescripcionMarca()+
					" "+detallesolicitudCompra.get(i).getIdProducto().getModelo()+" "+detallesolicitudCompra.get(i).getIdProducto().getColor()+
					" "+detallesolicitudCompra.get(i).getIdProducto().getBanda();
			detallesolicitudCompraBean.setNombreProducto(nombreProducto);
			Double precio = detallesolicitudCompra.get(i).getIdProducto().getPrecioCompra();
			Double cantidad = (double)detallesolicitudCompra.get(i).getCantidad();
			Double precioTotal = precio * cantidad;
			detallesolicitudCompraBean.setPrecioTotal(precioTotal);
			detallesolicitudCompraBean.setUnidadMedida(detallesolicitudCompra.get(i).getIdProducto().getUnidadMedida());
			detallesolicitudCompraBean.setCodigoProveedorProducto(detallesolicitudCompra.get(i).getIdProducto().getCodProductoProveedor());
			listsolicitud.add(detallesolicitudCompraBean);
		}
		
		return listsolicitud;
	}
	
	@Transactional
	public detalleSolicitudCompraBean getByIdDetalleSolicitud(Integer idDetalleSolicitud) {
		detalleSolicitudCompraBean detalleSolicitud = new detalleSolicitudCompraBean();
		detalleSolicitudCompra detalle = new detalleSolicitudCompra();
		String querySQL = "SELECT e FROM detalleSolicitudCompra e where e.idDetalleSolicitudCompra="+idDetalleSolicitud.toString();
		Query query = em.createQuery(querySQL);
		detalle = (detalleSolicitudCompra)query.getSingleResult();
		Double precio = detalle.getIdProducto().getPrecioCompra();
		Double cantidad = (double)detalle.getCantidad();
		Double precioTotal = precio * cantidad;
		detalleSolicitud.setPrecioTotal(precioTotal);
		detalleSolicitud.setCantidadRegistrada(detalle.getCantidadRegistrada());
		String nombreProducto = detalle.getIdProducto().getIdMarca().getDescripcionMarca()+
				" "+detalle.getIdProducto().getModelo()+" "+detalle.getIdProducto().getColor()+
				" "+detalle.getIdProducto().getBanda();
		detalleSolicitud.setNombreProducto(nombreProducto);
		detalleSolicitud.setCodigo(detalle.getIdSolicitudCompra().getIdUsuario().getIdTienda().getIdTienda());
		detalleSolicitud.setIdDetalleSolicitudCompra(detalle.getIdDetalleSolicitudCompra());
		detalleSolicitud.setDescripcionCategoria(detalle.getIdProducto().getIdCategoria().getDescripcionCategoria());
		detalleSolicitud.setNombreProveedor(detalle.getIdProducto().getIdProveedor().getNombreComercial());
		return detalleSolicitud;
	}


	@Override
	@SuppressWarnings("unchecked")
	public List<detalleSolicitudCompraBean> listSolicitudesbySolicitud(Integer idSolicitud) {
		List<detalleSolicitudCompra> detallesolicitudCompra = new ArrayList<detalleSolicitudCompra>();
		List<detalleSolicitudCompraBean> listsolicitud = new ArrayList<detalleSolicitudCompraBean>();
		String querySQL = "SELECT e FROM detalleSolicitudCompra e JOIN e.idSolicitudCompra u JOIN e.estado a WHERE u.idSolicitudCompra="+idSolicitud.toString()+" AND a.descripcion='SOLICITADO'";
		Query query = em.createQuery(querySQL);
		detallesolicitudCompra = query.getResultList();
		for(int i=0;i<detallesolicitudCompra.size();i++){
			detalleSolicitudCompraBean detallesolicitudCompraBean = new detalleSolicitudCompraBean();
			detallesolicitudCompraBean.setDescripcion(detallesolicitudCompra.get(i).getDescripcion());
			detallesolicitudCompraBean.setIdDetalleSolicitudCompra(detallesolicitudCompra.get(i).getIdDetalleSolicitudCompra());
			String dateTime = convertDATE.dateTimeMYSQL(detallesolicitudCompra.get(i).getFechaRegistro());
			detallesolicitudCompraBean.setFecha(dateTime);
			detallesolicitudCompraBean.setEstado(detallesolicitudCompra.get(i).getEstado().getDescripcion());
			detallesolicitudCompraBean.setCantidad(detallesolicitudCompra.get(i).getCantidad());
			detallesolicitudCompraBean.setCodigo(detallesolicitudCompra.get(i).getIdSolicitudCompra().getIdSolicitudCompra());
			String nombreProducto = detallesolicitudCompra.get(i).getIdProducto().getIdMarca().getDescripcionMarca()+
					" "+detallesolicitudCompra.get(i).getIdProducto().getModelo()+" "+detallesolicitudCompra.get(i).getIdProducto().getColor()+
					" "+detallesolicitudCompra.get(i).getIdProducto().getBanda();
			detallesolicitudCompraBean.setNombreProducto(nombreProducto);
			Double precio = detallesolicitudCompra.get(i).getIdProducto().getPrecioCompra();
			Double cantidad = (double)detallesolicitudCompra.get(i).getCantidad();
			Double precioTotal = precio * cantidad;
			detallesolicitudCompraBean.setPrecioTotal(precioTotal);
			listsolicitud.add(detallesolicitudCompraBean);
		}
		return listsolicitud;
	}

	@Transactional
	@Override
	public void updateCantidad(Integer idSolicitudDetalle,Integer cantidad ,String idProducto) {
		if(idProducto.equals("Empty")){
			String sql = "UPDATE detalleSolicitudCompra set cantidad="+cantidad.toString()+ "where idDetalleSolicitudCompra="+idSolicitudDetalle.toString();
			Query query = em.createQuery(sql);
			query.executeUpdate();
		}else{
			String sql = "UPDATE detalleSolicitudCompra set cantidad="+cantidad.toString()+", idProducto="+idProducto+" where idDetalleSolicitudCompra="+idSolicitudDetalle.toString();
			Query query = em.createQuery(sql);
			query.executeUpdate();
		}
		
	}
	
	@Transactional
	@Override
	public void updateCantidadRegistrada(Integer idSolicitudDetalle,Integer cantidad) {
		String sql = "UPDATE detalleSolicitudCompra set cantidadRegistrada="+cantidad.toString()+" where idDetalleSolicitudCompra="+idSolicitudDetalle.toString();
		Query query = em.createQuery(sql);
		query.executeUpdate();
	}

	@Transactional
	@Override
	public void updateEstado(Integer idSolicitudDetalle, Integer idEstado) {
		String sql = "UPDATE detalleSolicitudCompra set estado="+idEstado.toString()+" where idDetalleSolicitudCompra="+idSolicitudDetalle.toString();
		Query query = em.createQuery(sql);
		query.executeUpdate();
		
	}
	


	
}
