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
@Table(name="Categoria")
public class Categoria {

	@Id
	@Column(name="idCategoria")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idCategoria;
	
	@Column(name="descripcionCategoria" , length=50 , nullable=true)
	private String descripcionCategoria;
	
	@OneToMany(mappedBy="idCategoria")
	private Collection<Producto> producto;
	
	public Collection<Producto> getProducto() {
		return producto;
	}

	public void setProducto(Collection<Producto> producto) {
		this.producto = producto;
	}

	public Integer getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(Integer idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getDescripcionCategoria() {
		return descripcionCategoria;
	}

	public void setDescripcionCategoria(String descripcionCategoria) {
		this.descripcionCategoria = descripcionCategoria;
	}
}
