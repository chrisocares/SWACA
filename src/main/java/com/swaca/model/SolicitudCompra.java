package com.swaca.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="SolicitudCompra")
public class SolicitudCompra {

	@Id
	@Column(name="idSolicitudCompra")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idSolicitudCompra;
	
	@Column(name="fechaRegistro")
	private Date fechaRegistro;
	
	@Column(name="descripcion" , nullable=true , length=200)
	private String descripcion;
	
	@Column(name="codigoTiendaSolicitud")
	private Integer codigoTiendaSolicitud;
	
	@Column(name="fechaEntrega")
	private Date fechaEntrega;
	
	@ManyToOne
	@JoinColumn(name="estadoSolicitudCompra")
	private estadoSolicitudCompra estado;
	
	@OneToMany(mappedBy="idSolicitudCompra")
	private Collection<detalleSolicitudCompra> detalleSolicitud;

	@ManyToOne
	@JoinColumn(name="idUsuario")
	private Usuario idUsuario;
	
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

}
