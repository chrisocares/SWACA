package com.swaca.dao;

import java.util.List;

import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.model.detalleXorden;

public interface DetallexOrdenDao {

	detalleXorden createrDetallexOrden(detalleXorden detallexorden);
	List<detalleSolicitudCompraBean> getDetalleByIdOrden(String idOrdenCompra);
	
}
