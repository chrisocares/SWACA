package com.swaca.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Rol")
public class Rol {

	@Id
	@Column(name = "idRol")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idRol;
	
	@Column(name = "descripcionRol")
	private String descripcionRol; 
	
	@Column(name = "estadoRol")
	private String estadoRol;
	
	@OneToMany(mappedBy="rol")
	private Collection<Usuario> usuario;


	public Integer getIdRol() {
		return idRol;
	}

	public void setIdRol(Integer idRol) {
		this.idRol = idRol;
	}

	public String getDescripcionRol() {
		return descripcionRol;
	}

	public void setDescripcionRol(String descripcionRol) {
		this.descripcionRol = descripcionRol;
	}

	public String getEstadoRol() {
		return estadoRol;
	}

	public void setEstadoRol(String estadoRol) {
		this.estadoRol = estadoRol;
	}

	public Collection<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(Collection<Usuario> usuario) {
		this.usuario = usuario;
	}

}
