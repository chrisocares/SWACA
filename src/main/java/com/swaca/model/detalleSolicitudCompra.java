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
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="detalleSolicitudCompra")
public class detalleSolicitudCompra {

	@Id
	@Column(name="idDetalleSolicitudCompra")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idDetalleSolicitudCompra;
	
	@Column(name="fechaRegistro")
	private Date fechaRegistro;
	
	@Column(name="descripcion")
	private String descripcion;
	
	@Column(name="cantidad")
	private Integer cantidad;

	@Column(name="cantidadRegistrada" , columnDefinition = "int default 0")
	private Integer cantidadRegistrada;
	
	@Column(name="codigo")
	private Integer codigo;
	
	@ManyToOne
	@JoinColumn(name="estadoDetalle")
	private estadoDetalleSolicitudCompra estado;
	
	@OneToMany(mappedBy="idDetalleSolicitudCompra")
	private Collection<incidenciasDetalleSolicitud> incidencias;
	
	@OneToMany(mappedBy="logOperaciones")
	private Collection<LOGoperaciones> LOGoperaciones;
	
	@ManyToOne
	@JoinColumn(name="idProducto")
	private Producto idProducto;
	
	@ManyToOne
	@JoinColumn(name="idSolicitudCompra")
	private SolicitudCompra idSolicitudCompra;

	@OneToOne(mappedBy="detallecompra")
	private detalleXorden ordenCompra;
	
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

	public estadoDetalleSolicitudCompra getEstado() {
		return estado;
	}

	public void setEstado(estadoDetalleSolicitudCompra estado) {
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
	
	
	public Integer getCantidadRegistrada() {
		return cantidadRegistrada;
	}

	public void setCantidadRegistrada(Integer cantidadRegistrada) {
		this.cantidadRegistrada = cantidadRegistrada;
	}

}
