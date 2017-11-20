package com.swaca.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaca.bean.LOGoperacionesBean;
import com.swaca.bean.detalleSolicitudCompraBean;
import com.swaca.model.LOGoperaciones;
import com.swaca.model.detalleSolicitudCompra;
import com.swaca.util.DateTimeUtil;

@Service
public class logDaoImplement implements logDao{

	@PersistenceContext
	EntityManager em;
	
	DateTimeUtil convertDATE = new DateTimeUtil();
	
	@Override
	public List<LOGoperacionesBean> listLOGxDetalle(Integer id) {
		List<LOGoperaciones> logOperaciones = new ArrayList<LOGoperaciones>();
		List<LOGoperacionesBean> LOGOperaciones = new ArrayList<LOGoperacionesBean>();
		String querySQL = "SELECT e FROM LOGoperaciones e JOIN e.logOperaciones u WHERE u.idDetalleSolicitudCompra="+id.toString();
		Query query = em.createQuery(querySQL);
		logOperaciones = query.getResultList();
		
		for(int i=0;i<logOperaciones.size();i++){
			LOGoperacionesBean obj = new LOGoperacionesBean();
			obj.setCantidad(logOperaciones.get(i).getCantidad());
			obj.setCantidadActual(logOperaciones.get(i).getCantidadActual());
			obj.setDescripcion(logOperaciones.get(i).getDescripcion());
			String dateTime = convertDATE.dateTimeMYSQL(logOperaciones.get(i).getFecha()); 
			obj.setFecha(dateTime);
			obj.setIdLog(logOperaciones.get(i).getIdLog());
			String nombreProducto = logOperaciones.get(i).getLogOperaciones().getIdProducto().getIdMarca().getDescripcionMarca()+" "+
					logOperaciones.get(i).getLogOperaciones().getIdProducto().getModelo()+" - "+logOperaciones.get(i).getLogOperaciones().getIdProducto().getTipo()+" "+
					logOperaciones.get(i).getLogOperaciones().getIdProducto().getColor()+" "+logOperaciones.get(i).getLogOperaciones().getIdProducto().getBanda();
			obj.setProducto(nombreProducto);
			LOGOperaciones.add(obj);
		}
		
		return LOGOperaciones;
	}

}
