package com.swaca.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.swaca.model.detalleSolicitudCompra;

public class LOGoperacionesBean {

	public Integer getIdLog() {
		return idLog;
	}

	public void setIdLog(Integer idLog) {
		this.idLog = idLog;
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

	public String getProducto() {
		return Producto;
	}

	public void setProducto(String producto) {
		Producto = producto;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
	private Integer idLog;

	private String fecha;

	private String descripcion;

	private String cantidad;

	private String cantidadActual;

	private detalleSolicitudCompra logOperaciones;
	
	private String Producto;

}
