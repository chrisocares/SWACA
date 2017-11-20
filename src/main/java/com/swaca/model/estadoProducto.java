package com.swaca.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="estadoProducto")
public class estadoProducto {
	
	@Id
	@Column(name="idEstado")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idEstado;
	
	@Column(name="descripcion" , length=50 , nullable=true)
	private String descripcion;
	
	@OneToMany(mappedBy="estado")
	private Collection<Producto> producto;
	
	public Integer getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(Integer idEstado) {
		this.idEstado = idEstado;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Collection<Producto> getProducto() {
		return producto;
	}

	public void setProducto(Collection<Producto> producto) {
		this.producto = producto;
	}
	
}
