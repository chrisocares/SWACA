package com.swaca.dao;

import java.util.ArrayList;
import java.util.List;

import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.detalleSolicitudCompra;

public interface detalleSolicitudCompraDao {

	detalleSolicitudCompra createDetalle (detalleSolicitudCompra detalle , int idSolicitud ,int idProducto);
	List<detalleSolicitudCompraBean> listSolicitudes();
	List<detalleSolicitudCompraBean> listSolicitudesbyProveedor(Integer idProveedor);
	detalleSolicitudCompraBean getByIdDetalleSolicitud(Integer idDetalleSolicitud);
	List<detalleSolicitudCompraBean> listSolicitudesbySolicitud(Integer idSolicitud);
	void updateCantidad(Integer idSolicitudDetalle , Integer Cantidad);
	void updateCantidadRegistrada(Integer idSolicitudDetalle , Integer Cantidad);
	void updateEstado(Integer idSolicitudDetalle , Integer idEstado);
}
