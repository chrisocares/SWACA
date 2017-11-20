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
@Table(name="Marca")
public class Marca {

	@Id
	@Column(name="idMarca")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idMarca;
	
	@Column(name="descripcionMarca" , length=50 , nullable=true) 
	private String descripcionMarca;
	
	@OneToMany(mappedBy="idMarca")
	private Collection<Producto> producto;
	
	public Collection<Producto> getProducto() {
		return producto;
	}

	public void setProducto(Collection<Producto> producto) {
		this.producto = producto;
	}

	public Integer getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(Integer idMarca) {
		this.idMarca = idMarca;
	}

	public String getDescripcionMarca() {
		return descripcionMarca;
	}

	public void setDescripcionMarca(String descripcionMarca) {
		this.descripcionMarca = descripcionMarca;
	}
	
}
