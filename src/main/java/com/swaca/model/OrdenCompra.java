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
@Table(name="OrdenCompra")
public class OrdenCompra {

	@Id
	@Column(name="idOrdenCompra")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idOrdenCompra;
	
	@ManyToOne
	@JoinColumn(name="idUsuario")
	private Usuario idUsuario;
	
	@Column(name="direccionEntrega")
	private String direccionEntrega;
	
	@Column(name="observaciones")
	private String observaciones;
	
	@Column(name="subTotal" , length = 10, precision = 2)
	private double subtotal;
	
	@Column(name="IGV" , length = 10, precision = 2)
	private double IGV;
	
	@Column(name="total" , length = 10, precision = 2)
	private double total;
	
	@Column(name="fechaEmitida")
	private Date fechaEmitida;
	
	@OneToMany(mappedBy = "ordenCompra")
	private Collection<detalleXorden> detallexorden;
	
	@ManyToOne
	@JoinColumn(name="idProveedor")
	private Proveedor idProveedor;
	
	@ManyToOne
	@JoinColumn(name="estadoOrdenCompra")
	private estadoOrdenCompra estado;
	
	public estadoOrdenCompra getEstado() {
		return estado;
	}

	public void setEstado(estadoOrdenCompra estado) {
		this.estado = estado;
	}

	public Proveedor getIdProveedor() {
		return idProveedor;
	}

	public void setIdProveedor(Proveedor idProveedor) {
		this.idProveedor = idProveedor;
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

}
