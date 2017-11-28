package com.swaca.dao;

import java.util.List;

import com.swaca.bean.almacenTiendaBean;
import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.AlmacenTienda;

public interface AlmacenTiendaDao {
	AlmacenTienda createAlmacen (AlmacenTienda obj);
	void UpdateAlmacen (String idDetalle,String cantidad);
	String existeRegistro(String idDetalle);
	List<almacenTiendaBean> listAlmacen(String estado , String idTienda);
	almacenTiendaBean getByIdDetalleAlmacen(Integer idDetalleSolicitud);
}
