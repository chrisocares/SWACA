package com.swaca.dao;

import java.util.List;

import com.swaca.bean.ProveedorBean;
import com.swaca.model.Proveedor;

public interface proveedorDao {
	Proveedor createProveedor(Proveedor proveedor);
	Proveedor editProveedor(Proveedor proveedor);
	ProveedorBean getByidProveedor(Integer idProveedor);
	boolean deleteProveedor(int idProveedor);
	List<ProveedorBean> listProveedor();
}
