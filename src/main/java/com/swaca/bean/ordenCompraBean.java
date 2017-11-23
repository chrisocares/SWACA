package com.swaca.bean;

import java.util.Collection;
import java.util.Date;

import com.swaca.model.Proveedor;
import com.swaca.model.Usuario;
import com.swaca.model.detalleXorden;
import com.swaca.model.estadoOrdenCompra;

public class ordenCompraBean {
	
	public String getEmitente() {
		return Emitente;
	}

	public void setEmitente(String emitente) {
		Emitente = emitente;
	}
	
	public Integer getIdOrdenCompra() {
		return idOrdenCompra;
	}

	public void setIdOrdenCompra(Integer idOrdenCompra) {
		this.idOrdenCompra = idOrdenCompra;
	}

	public Usuario getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Usuario idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getDireccionEntrega() {
		return direccionEntrega;
	}

	public void setDireccionEntrega(String direccionEntrega) {
		this.direccionEntrega = direccionEntrega;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public double getIGV() {
		return IGV;
	}

	public void setIGV(double iGV) {
		IGV = iGV;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getFechaEmitida() {
		return fechaEmitida;
	}

	public void setFechaEmitida(Date fechaEmitida) {
		this.fechaEmitida = fechaEmitida;
	}

	public Collection<detalleXorden> getDetallexorden() {
		return detallexorden;
	}

	public void setDetallexorden(Collection<detalleXorden> detallexorden) {
		this.detallexorden = detallexorden;
	}
	
	public Proveedor getIdProveedor() {
		return idProveedor;
	}

	public void setIdProveedor(Proveedor idProveedor) {
		this.idProveedor = idProveedor;
	}
	
	public String getNombreProveedor() {
		return nombreProveedor;
	}

	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}

	public String getNombreestado() {
		return nombreestado;
	}

	public void setNombreestado(String nombreestado) {
		this.nombreestado = nombreestado;
	}

	public estadoOrdenCompra getEstado() {
		return estado;
	}

	public void setEstado(estadoOrdenCompra estado) {
		this.estado = estado;
	}

	public String getCorreoProveedor() {
		return correoProveedor;
	}

	public void setCorreoProveedor(String correoProveedor) {
		this.correoProveedor = correoProveedor;
	}
	
	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getEstadoDescripcion() {
		return estadoDescripcion;
	}

	public void setEstadoDescripcion(String estadoDescripcion) {
		this.estadoDescripcion = estadoDescripcion;
	}
	
	private Proveedor idProveedor;

	private Integer idOrdenCompra;

	private Usuario idUsuario;

	private String direccionEntrega;

	private String observaciones;

	private double subtotal;

	private double IGV;

	private double total;

	private Date fechaEmitida;

	private String fecha; 
	
	private Collection<detalleXorden> detallexorden;

	private String nombreProveedor;

	private String nombreestado;

	private estadoOrdenCompra estado;
	
	private String correoProveedor;
	
	private String Emitente;
	
	private String estadoDescripcion;

}

