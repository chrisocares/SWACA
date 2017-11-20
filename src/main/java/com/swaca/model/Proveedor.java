package com.swaca.model;

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
@Table(name="Proveedor")
public class Proveedor {

	@Id
	@Column(name="idProveedor")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idProveedor;
	
	@Column(name="nombreComercial" , length=100 , nullable=true)
	private String nombreComercial;
	
	@Column(name="razonSocial" , length=100 ,nullable=true)
	private String razonSocial;
	
	@Column(name="tratamiento" , length=50 ,nullable=true)
	private String tratamiento;
	
	@Column(name="ruc" , length=20 , nullable=true)
	private Integer ruc;
	
	@Column(name="telefonoContacto" , length=9 , nullable=true)
	private Integer telefonoContacto;
	
	@Column(name="email" , length=40 , nullable=true)
	private String email;
	
	@Column(name="direccion" , length=100 , nullable=true)
	private String direccion;
	
	@Column(name="nombreContacto" , length=40 , nullable=true)
	private String nombreContacto;
	
	@Column(name="pais" , length=10 ,nullable=true)
	private String pais;

	@Column(name="departamento" , length=20 ,nullable=true)
	private String departamento;

	@Column(name="distrito" , length=20 ,nullable=true)
	private String distrito;
	
	@Column(name="estado" , length=10 , nullable=false)
	private String estado;	
		
	@Column(name="grupoPago" , length=50 , nullable=false)
	private String grupoPago;	
	
	@Column(name="tipoMoneda" , length=10 , nullable=false)
	private String tipoMoneda;	
	
	@Column(name="preFijotipoMoneda" , length=10 , nullable=false)
	private String preFijotipoMoneda;	

	@Column(name="condicionPago" , length=50 , nullable=false)
	private String condicionPago;	
	
	@OneToMany(mappedBy="idProveedor")
	private Collection<Producto> producto;
	
	@OneToMany(mappedBy="idProveedor")
	private Collection<OrdenCompra> ordenCompra;
	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Collection<Producto> getProducto() {
		return producto;
	}

	public void setProducto(Collection<Producto> producto) {
		this.producto = producto;
	}
	
	public Integer getIdProveedor() {
		return idProveedor;
	}

	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}

	public String getNombreComercial() {
		return nombreComercial;
	}

	public void setNombreComercial(String nombreComercial) {
		this.nombreComercial = nombreComercial;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public String getTratamiento() {
		return tratamiento;
	}

	public void setTratamiento(String tratamiento) {
		this.tratamiento = tratamiento;
	}

	public Integer getRuc() {
		return ruc;
	}

	public void setRuc(Integer ruc) {
		this.ruc = ruc;
	}

	public Integer getTelefonoContacto() {
		return telefonoContacto;
	}

	public void setTelefonoContacto(Integer telefonoContacto) {
		this.telefonoContacto = telefonoContacto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getNombreContacto() {
		return nombreContacto;
	}

	public void setNombreContacto(String nombreContacto) {
		this.nombreContacto = nombreContacto;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	
	public String getGrupoPago() {
		return grupoPago;
	}

	public void setGrupoPago(String grupoPago) {
		this.grupoPago = grupoPago;
	}

	public String getTipoMoneda() {
		return tipoMoneda;
	}

	public void setTipoMoneda(String tipoMoneda) {
		this.tipoMoneda = tipoMoneda;
	}

	public String getCondicionPago() {
		return condicionPago;
	}

	public void setCondicionPago(String condicionPago) {
		this.condicionPago = condicionPago;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
	
	public String getPreFijotipoMoneda() {
		return preFijotipoMoneda;
	}

	public void setPreFijotipoMoneda(String preFijotipoMoneda) {
		this.preFijotipoMoneda = preFijotipoMoneda;
	}
}
