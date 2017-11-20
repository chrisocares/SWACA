package com.swaca.bean;

import javax.persistence.Column;


public class ProveedorBean {
	
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
	private Integer idProveedor;
	private String nombreComercial;
	private String razonSocial;
	private String tratamiento;
	private Integer ruc;
	private Integer telefonoContacto;
	private String email;
	private String direccion;
	private String nombreContacto;
	private String pais;
	private String departamento;
	private String grupoPago;	
	private String tipoMoneda;	
	private String condicionPago;
	private String distrito;

}
