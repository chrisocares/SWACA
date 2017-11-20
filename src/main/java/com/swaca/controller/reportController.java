package com.swaca.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaca.dao.reportDao;

@Controller
public class reportController {
	
	@Autowired
	private reportDao reporte;

    @RequestMapping(method = RequestMethod.POST , value = "GenerarReporte-{idOrdenCompra}")
    public @ResponseBody void generatePdfReport(HttpServletRequest request, HttpServletResponse response , @PathVariable("idOrdenCompra") String idOrdenCompra){
		String contextPath = request.getServletContext().getRealPath("report/OrdenCompraReport.jrxml");
    	reporte.generarReporteOrdenCompra(contextPath,idOrdenCompra);
      
     }
    
}
