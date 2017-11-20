package com.swaca.dao;

import java.util.Map;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@Service
public class reportDaoImplement implements reportDao{

	@PersistenceContext
	EntityManager em ; 
	
	
	@Transactional
	@Override
	public void generarReporteOrdenCompra(String ruta,String idOrdenCompra) {
	    try {
           InputStream input = new FileInputStream(new File(ruta));
           System.out.println("Ruta  : ="+ruta);
           JasperDesign jasperDesign = JRXmlLoader.load(input);
           System.out.println("Compilando Report Diseño");
           JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
           System.out.println("Creando JasperPrint Object");
           HashMap<String, Object> parameters = new HashMap<String, Object>(); 
           parameters.put("idOrdenCompra", idOrdenCompra);
           Session session = (Session) em.getDelegate();
           Connection conn = session.connection();
           JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameters,conn);
           File f = new File("C:/g/ordenCompra.pdf");
           f.createNewFile();
           OutputStream output = new FileOutputStream(f);
           JasperExportManager.exportReportToPdfStream(jasperPrint, output);
           
           System.out.println("Reporet Generado Completo");
           conn.close();
           output.flush();
           output.close();
	    	} catch (Exception ex) {
	        ex.printStackTrace();   
	    	}
        }

}
