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
@Table(name="Tienda")
public class Tienda {

	@Id
	@Column(name="idTienda")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idTienda;

	@Column(name="descripcion")
	private String descripcion;
	
	@Column(name="direccion" , length=80 )
	private String direccion;
	
	@Column(name="departamento" , length=15)
	private String departamento;
	
	@Column(name="distrito" , length=50)
	private String distrito;
	
	@Column(name="ruc" , length=50)
	private String ruc;

	@Column(name="telefono" , length=11)
	private String telefono;
	
	@Column(name="estado")
	private String estado;
	
	@OneToMany(mappedBy="idTienda")
	private Collection<Usuario> usuario;
	
	public Integer getIdTienda() {
		return idTienda;
	}

	public void setIdTienda(Integer idTienda) {
		this.idTienda = idTienda;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Collection<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(Collection<Usuario> usuario) {
		this.usuario = usuario;
	}
	
	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
}
