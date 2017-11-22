package com.swaca.dao;

import java.util.List;

import javax.servlet.http.HttpSession;
import com.swaca.bean.ordenCompraBean;
import com.swaca.model.OrdenCompra;


public interface ordenCompraDao {

	OrdenCompra createOrden (OrdenCompra ordenCompra); 
	ordenCompraBean getOrden (String idOrden, HttpSession session);
	ordenCompraBean getOrdenbyId (String idOrden);
	List<ordenCompraBean> listOrdenesCompra(String idEstado);
	String getnumeroOrden();
	void updateEstado(String idOrden , String idestado);
}
