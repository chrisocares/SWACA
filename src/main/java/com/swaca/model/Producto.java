package com.swaca.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Producto")
public class Producto {
	
	@Id
	@Column(name="idProducto")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idProducto;
	
	@OneToMany(mappedBy="idProducto")
	private Collection<detalleSolicitudCompra> detalleSolicitud;
	
	@ManyToOne
	@JoinColumn(name="idProveedor")
	private Proveedor idProveedor;
	
	@ManyToOne
	@JoinColumn(name="idMarca")
	private Marca idMarca;
	
	@ManyToOne
	@JoinColumn(name="idCategoria")
	private Categoria idCategoria;
	
	@ManyToOne
	@JoinColumn(name="estadoProducto")
	private estadoProducto estado;
	
	@Column(name="tipo" , length=50 , nullable=true)
	private String tipo;
	
	@Column(name="color", length=20 , nullable=true)
	private String color;
	
	@Column(name="modelo", length=20 , nullable=true)
	private String modelo;
	
	@Column(name="banda", length=5 , nullable=true)
	private String banda;

	@Column(name="codProductoProveedor", length=10 , nullable=true)
	private String codProductoProveedor;

	@Column(name="unidadMedida", nullable=true)
	private String unidadMedida;
	
	@Column(name="precioCompra")
	private Double precioCompra;
	
	@Column(name="valor")
	private Double valor;
	
	@Column(name="fechaRegistro")
	private Date fechaRegistro;
	
	@Column(name="fechaModificado")
	private Date fechaModificado;
	
	
	public Integer getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(Integer idProducto) {
		this.idProducto = idProducto;
	}

	public Proveedor getIdProveedor() {
		return idProveedor;
	}
	
	public String getCodProductoProveedor() {
		return codProductoProveedor;
	}

	public void setCodProductoProveedor(String codProductoProveedor) {
		this.codProductoProveedor = codProductoProveedor;
	}


	public void setIdProveedor(Proveedor idProveedor) {
		this.idProveedor = idProveedor;
	}

	public Marca getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Marca idMarca) {
		this.idMarca = idMarca;
	}

	public Categoria getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Categoria idCategoria) {
		this.idCategoria = idCategoria;
	}

	public estadoProducto getEstado() {
		return estado;
	}

	public void setEstado(estadoProducto estado) {
		this.estado = estado;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getBanda() {
		return banda;
	}

	public void setBanda(String banda) {
		this.banda = banda;
	}

	public Double getPrecioCompra() {
		return precioCompra;
	}

	public void setPrecioCompra(Double precioCompra) {
		this.precioCompra = precioCompra;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public Date getFechaModificado() {
		return fechaModificado;
	}

	public void setFechaModificado(Date fechaModificado) {
		this.fechaModificado = fechaModificado;
	}
	
	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

}
