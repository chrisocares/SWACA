package com.swaca.model;

import java.sql.Date;
import java.util.Collection;

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
@Table (name="Usuario")
public class Usuario {

	@Id
	@Column(name="idUsuario")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idUsuario;
	
	@Column(name= "estadoUsuario" , length = 1 , nullable=false)
	private String estadoUsuario;
	
	@Column(name = "correo" , nullable = false)
	private String correo;
	
	@Column(name = "contraseña" , length = 8 , nullable = false)
	private String contraseña;
	
	@Column(name = "nombre" , nullable = false)
	private String nombre; 
	
	@Column(name = "apellido" , nullable = false)
	private String apellido; 
	
	@Column(name = "celular" , length = 9 , nullable = false)
	private Integer celular;
	
	@Column(name = "telefono" , length = 7 ,nullable = false)
	private Integer telefono;
	
	@Column(name = "direccion" , nullable = false)
	private String direccion;
	
	@Column(name = "fechaNacimiento" , nullable = false)
	private Date fechaNacimiento;
	
	@Column(name = "sexo" , length = 1 ,nullable = false)
	private String sexo;
	
	@Column(name = "numeroDocumento" , length = 8 , nullable = false)
	private Integer numeroDocumento;
	
	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	@ManyToOne
	@JoinColumn(name="idRol")
	private Rol rol;
	
	@ManyToOne
	@JoinColumn(name="idTienda")
	private Tienda idTienda;
	
	@OneToMany(mappedBy="idUsuario")
	private Collection<SolicitudCompra> idSolicitud;

	@OneToMany(mappedBy="idUsuario")
	private Collection<OrdenCompra> idOrdenCompra;
	
	public Collection<OrdenCompra> getIdOrdenCompra() {
		return idOrdenCompra;
	}

	public void setIdOrdenCompra(Collection<OrdenCompra> idOrdenCompra) {
		this.idOrdenCompra = idOrdenCompra;
	}
	
	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getEstadoUsuario() {
		return estadoUsuario;
	}

	public void setEstadoUsuario(String estadoUsuario) {
		this.estadoUsuario = estadoUsuario;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Integer getCelular() {
		return celular;
	}

	public void setCelular(Integer celular) {
		this.celular = celular;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Integer getNumeroDocumento() {
		return numeroDocumento;
	}

	public void setNumeroDocumento(Integer numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}


	public Tienda getIdTienda() {
		return idTienda;
	}

	public void setIdTienda(Tienda idTienda) {
		this.idTienda = idTienda;
	}

	public Collection<SolicitudCompra> getIdSolicitud() {
		return idSolicitud;
	}

	public void setIdSolicitud(Collection<SolicitudCompra> idSolicitud) {
		this.idSolicitud = idSolicitud;
	}
}
