package com.swaca.bean;

import java.util.Collection;
import java.util.Date;

import com.swaca.model.Producto;
import com.swaca.model.SolicitudCompra;
import com.swaca.model.estadoDetalleSolicitudCompra;
import com.swaca.model.incidenciasDetalleSolicitud;

public class detalleSolicitudCompraBean {
	

	public Integer getIdSolicitud() {
		return idSolicitud;
	}

	public void setIdSolicitud(Integer idSolicitud) {
		this.idSolicitud = idSolicitud;
	}
	
	public String getNombreProducto() {
		return NombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		NombreProducto = nombreProducto;
	}

	public Integer getIdDetalleSolicitudCompra() {
		return idDetalleSolicitudCompra;
	}

	public void setIdDetalleSolicitudCompra(Integer idDetalleSolicitudCompra) {
		this.idDetalleSolicitudCompra = idDetalleSolicitudCompra;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Collection<incidenciasDetalleSolicitud> getIncidencias() {
		return incidencias;
	}

	public void setIncidencias(Collection<incidenciasDetalleSolicitud> incidencias) {
		this.incidencias = incidencias;
	}

	public Producto getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(Producto idProducto) {
		this.idProducto = idProducto;
	}

	public SolicitudCompra getIdSolicitudCompra() {
		return idSolicitudCompra;
	}

	public void setIdSolicitudCompra(SolicitudCompra idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
	}

	public Double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(Double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Integer getCantidadRegistrada() {
		return cantidadRegistrada;
	}

	public void setCantidadRegistrada(Integer cantidadRegistrada) {
		this.cantidadRegistrada = cantidadRegistrada;
	}

	private Integer idDetalleSolicitudCompra;

	private Date fechaRegistro;
	
	private String fecha;

	private String descripcion;

	private Integer cantidad;

	private Integer codigo;

	private String estado;

	private Collection<incidenciasDetalleSolicitud> incidencias;

	private Producto idProducto;

	private SolicitudCompra idSolicitudCompra;
	
	private String NombreProducto;

	private Double precioTotal;
	
	private Integer idSolicitud;
	
	private Integer cantidadRegistrada;

	public String getNombreProveedor() {
		return nombreProveedor;
	}

	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}

	public String getDescripcionCategoria() {
		return descripcionCategoria;
	}

	public void setDescripcionCategoria(String descripcionCategoria) {
		this.descripcionCategoria = descripcionCategoria;
	}

	private String nombreProveedor ;
	
	private String descripcionCategoria;
	
	private String unidadMedida;

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	
	private String codigoProveedorProducto;

	public String getCodigoProveedorProducto() {
		return codigoProveedorProducto;
	}

	public void setCodigoProveedorProducto(String codigoProveedorProducto) {
		this.codigoProveedorProducto = codigoProveedorProducto;
	}
}
