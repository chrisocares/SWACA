package com.swaca.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="detallexorden")
public class detalleXorden {

	@Id
	@Column(name="idDetalleOrden")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idDetallexOrden;
	
	@Column(name="fechaEmitida")
	private Date fechaEmitida;
	
	@Column(name="precio")
	private Double precio;
		
	@OneToOne
	@JoinColumn(name = "idDetalleSolicitudCompra")
	private detalleSolicitudCompra detallecompra;
	
	@ManyToOne
	@JoinColumn(name = "idOrdenCompra")
	private OrdenCompra ordenCompra;
	
	public Integer getIdDetallexOrden() {
		return idDetallexOrden;
	}

	public void setIdDetallexOrden(Integer idDetallexOrden) {
		this.idDetallexOrden = idDetallexOrden;
	}

	public Date getFechaEmitida() {
		return fechaEmitida;
	}

	public void setFechaEmitida(Date fechaEmitida) {
		this.fechaEmitida = fechaEmitida;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public detalleSolicitudCompra getDetallecompra() {
		return detallecompra;
	}

	public void setDetallecompra(detalleSolicitudCompra detallecompra) {
		this.detallecompra = detallecompra;
	}

	public OrdenCompra getOrdenCompra() {
		return ordenCompra;
	}

	public void setOrdenCompra(OrdenCompra ordenCompra) {
		this.ordenCompra = ordenCompra;
	}

}
