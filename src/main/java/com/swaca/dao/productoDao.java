package com.swaca.dao;

import java.util.List;

import com.swaca.bean.ProductoBean;
import com.swaca.model.Producto;

public interface productoDao {

	List<ProductoBean> listDatosProducto();
	ProductoBean getByidProducto(int idProducto);
}
