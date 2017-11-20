package com.swaca.dao;

import java.util.List;

import com.swaca.bean.LOGoperacionesBean;
import com.swaca.bean.detalleSolicitudCompraBean;

public interface logDao {
	
	List<LOGoperacionesBean> listLOGxDetalle(Integer id);
}
