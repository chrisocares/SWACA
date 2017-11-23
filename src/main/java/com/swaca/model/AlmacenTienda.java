package com.swaca.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="AlmacenTienda")
public class AlmacenTienda {

	@Id
	@Column(name="idAlmacenTienda")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idAlmacenTienda;

	@Column(name="Date" , length=50 , nullable=true) 
	private Date fecha;
	
	@Column(name="idTienda" , length=500 , nullable=true) 
	private String idTienda;
	
	@Column(name="estado" , length=500 , nullable=true) 
	private String estado;

	@Column(name="cantidadRegistrada" , length=50 , nullable=true) 
	private String cantidadRegistrada;
	
	@Column(name="idDetalle" , length=50 , nullable=true) 
	private String idDetalle;
	
	
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
	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}
