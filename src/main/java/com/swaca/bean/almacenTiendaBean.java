package com.swaca.bean;

import java.util.Date;

import javax.persistence.Column;

public class almacenTiendaBean {
	public Integer getIdAlmacenTienda() {
		return idAlmacenTienda;
	}

	public void setIdAlmacenTienda(Integer idAlmacenTienda) {
		this.idAlmacenTienda = idAlmacenTienda;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getIdTienda() {
		return idTienda;
	}

	public void setIdTienda(String idTienda) {
		this.idTienda = idTienda;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCantidadRegistrada() {
		return cantidadRegistrada;
	}

	public void setCantidadRegistrada(String cantidadRegistrada) {
		this.cantidadRegistrada = cantidadRegistrada;
	}

	public String getIdDetalle() {
		return idDetalle;
	}

	public void setIdDetalle(String idDetalle) {
		this.idDetalle = idDetalle;
	}

	private Integer idAlmacenTienda;

	private Date fecha;

	private String idTienda;

	private String estado;

	private String cantidadRegistrada;

	private String idDetalle;
}
