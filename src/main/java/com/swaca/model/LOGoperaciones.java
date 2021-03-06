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
@Table(name="LOGoperaciones")
public class LOGoperaciones {

	@Id
	@Column(name="idLog")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idLog;
	
	@Column(name="Date" , length=50 , nullable=true) 
	private Date fecha;
	
	@Column(name="descripcion" , length=500 , nullable=true) 
	private String descripcion;
	
	@Column(name="cantidad" , length=50 , nullable=true) 
	private String cantidad;
	
	@Column(name="cantidadActual" , length=50 , nullable=true) 
	private String cantidadActual;
	
	@ManyToOne
	@JoinColumn(name="LOG")
	private detalleSolicitudCompra logOperaciones;
	
	public Integer getIdLog() {
		return idLog;
	}

	public void setIdLog(Integer idLog) {
		this.idLog = idLog;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}

	public String getCantidadActual() {
		return cantidadActual;
	}

	public void setCantidadActual(String cantidadActual) {
		this.cantidadActual = cantidadActual;
	}

	public detalleSolicitudCompra getLogOperaciones() {
		return logOperaciones;
	}

	public void setLogOperaciones(detalleSolicitudCompra logOperaciones) {
		this.logOperaciones = logOperaciones;
	}
	

}
