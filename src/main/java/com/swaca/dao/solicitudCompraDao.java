package com.swaca.dao;

import java.util.List;

import com.swaca.bean.SolicitudCompraBean;
import com.swaca.model.SolicitudCompra;

public interface solicitudCompraDao {
	String getnumeroSolicitud();
	SolicitudCompra createSolicitud(SolicitudCompra solicitudCompra);
	List<SolicitudCompraBean> listSolicitudes(String idEstado);
	List<SolicitudCompraBean> listSolicitudesbyTienda(String idTienda,String estado);
	void updateEstado(Integer idOrden , Integer idEstado);
}
