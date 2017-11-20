package com.swaca.bean;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.swaca.model.Usuario;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.estadoSolicitudCompra;

public class SolicitudCompraBean {

	public Integer getIdSolicitudCompra() {
		return idSolicitudCompra;
	}

	public void setIdSolicitudCompra(Integer idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
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

	public Integer getCodigoTiendaSolicitud() {
		return codigoTiendaSolicitud;
	}

	public void setCodigoTiendaSolicitud(Integer codigoTiendaSolicitud) {
		this.codigoTiendaSolicitud = codigoTiendaSolicitud;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public estadoSolicitudCompra getEstado() {
		return estado;
	}

	public void setEstado(estadoSolicitudCompra estado) {
		this.estado = estado;
	}

	public Collection<detalleSolicitudCompra> getDetalleSolicitud() {
		return detalleSolicitud;
	}

	public void setDetalleSolicitud(
			Collection<detalleSolicitudCompra> detalleSolicitud) {
		this.detalleSolicitud = detalleSolicitud;
	}

	public Usuario getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Usuario idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public String getDescripcionEstado() {
		return descripcionEstado;
	}

	public void setDescripcionEstado(String descripcionEstado) {
		this.descripcionEstado = descripcionEstado;
	}

	public String getDescripcionTienda() {
		return descripcionTienda;
	}

	public void setDescripcionTienda(String descripcionTienda) {
		this.descripcionTienda = descripcionTienda;
	}
	
	public String getFechaRegistro1() {
		return fechaRegistro1;
	}

	public void setFechaRegistro1(String fechaRegistro1) {
		this.fechaRegistro1 = fechaRegistro1;
	}


	private Integer idSolicitudCompra;

	private Date fechaRegistro;

	private String descripcion;

	private Integer codigoTiendaSolicitud;

	private Date fechaEntrega;

	private estadoSolicitudCompra estado;

	private Collection<detalleSolicitudCompra> detalleSolicitud;

	private Usuario idUsuario;
	
	private String descripcionEstado;
	
	private String descripcionTienda;
	
	private String fechaRegistro1;
}
