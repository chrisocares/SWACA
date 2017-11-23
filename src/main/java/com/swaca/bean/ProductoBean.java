package com.swaca.bean;

import java.util.Collection;
import java.util.Date;

import com.swaca.model.Categoria;
import com.swaca.model.Marca;
import com.swaca.model.Proveedor;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.estadoProducto;

public class ProductoBean {
	
	private Integer idProducto;	
	private Collection<detalleSolicitudCompra> detalleSolicitud;
	private String idProveedor;
	private String idMarca;
	private String idCategoria;	
	private estadoProducto estado;
	private String tipo;
	private String color;
	private String modelo;
	private String banda;
	private String nombreLista;
	private Double precioCompra;
	private Double valor;
	private Date fechaRegistro;
	private Date fechaModificado;
	
	public Integer getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(Integer idProducto) {
		this.idProducto = idProducto;
	}

	public Collection<detalleSolicitudCompra> getDetalleSolicitud() {
		return detalleSolicitud;
	}

	public void setDetalleSolicitud(
			Collection<detalleSolicitudCompra> detalleSolicitud) {
		this.detalleSolicitud = detalleSolicitud;
	}

	public String getIdProveedor() {
		return idProveedor;
	}

	public void setIdProveedor(String idProveedor) {
		this.idProveedor = idProveedor;
	}

	public String getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(String idMarca) {
		this.idMarca = idMarca;
	}

	public String getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(String idCategoria) {
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
	
	public String getNombreLista() {
		return nombreLista;
	}

	public void setNombreLista(String nombreLista) {
		this.nombreLista = nombreLista;
	}
	
	private String codigProductoProveedor;

	public String getCodigProductoProveedor() {
		return codigProductoProveedor;
	}

	public void setCodigProductoProveedor(String codigProductoProveedor) {
		this.codigProductoProveedor = codigProductoProveedor;
	}

}
