<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWACA - Crear Orden de Compra</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Fira+Sans|Roboto:300,400|Questrial|Satisfy">
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="plugins/mdl/material.min.css" type="text/css">
<link rel="stylesheet" href="plugins/MDB/css/mdb.min.css" type="text/css">
<link rel="stylesheet" href="plugins/select2/css/select2.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="plugins/datepicker/css/datepicker.css" type="text/css">
<link rel="stylesheet" href="plugins/css/dataTables.bootstrap4.min.css" type="text/css">
<link rel="stylesheet" href="css/ordenCompra.css" type="text/css">
</head>
<body>
	  <jsp:include page="../Almacen/PageMasterAlmacen.jsp"></jsp:include>
	  <main class="mdl-layout__content">
	    <div class="page-content"><!-- Your content goes here -->
	    	<div class="container" id="ordenCompraContainer">
	    		<div class="logoOrdenCompra">
	    			<img src="images/logo_f.png" class="logoays" width="120" height="120"></img>
		    		<div>
		    			<p class="noMP"><b>ANDROID & SMART</b></p>
		    			<p class="noMP">${ordenCompra.idUsuario.idTienda.direccion}</p>
		    			<p class="noMP">${ordenCompra.idUsuario.idTienda.distrito} ${ordenCompra.idUsuario.idTienda.departamento}</p>
		    			<p class="noMP">RUC : ${ordenCompra.idUsuario.idTienda.ruc} Telefono(s): ${ordenCompra.idUsuario.idTienda.telefono}</p>
		    		</div>
	    		</div>
	    		<div class="col-sm-12 text-center cabecera">
	    			<div><h3><b>ORDEN N° ${ordenCompra.idOrdenCompra}</b></h3></div>
	    			<div><p>FECHA DE EMISIÓN: <b>${ordenCompra.fechaEmitida}</b></p></div>
	    		</div>
	    		<div class="tableCabecera">
	    			<table class="table table-bordered">
						<tr>
							<th colspan="5" class="text-center"><b>DATOS DEL PROVEEDOR</b></th>
						</tr>
						<tr>
							<td><b>Código : </b><p>${ordenCompra.idProveedor.idProveedor}</p></td>
							<td><b>RUC : </b><p>${ordenCompra.idProveedor.ruc}</p></td>
							<td colspan="1"><b>NOMBRE : </b><p>${ordenCompra.idProveedor.nombreComercial}</p></td>
							<td colspan="2"><b>TIPO DE EMPRESA : </b><p>${ordenCompra.idProveedor.tratamiento}</p></td>
						</tr>
						<tr>
							<td colspan="2"><b>Dirección : </b><p>${ordenCompra.idProveedor.direccion}</p></td>
							<td><b>Distrito : </b><p>${ordenCompra.idProveedor.distrito}</p></td>
							<td><b>Ciudad : </b><p>${ordenCompra.idProveedor.departamento}</p></td>
							<td><b>País : </b><p>${ordenCompra.idProveedor.pais}</p></td>
						</tr>
						<tr>
							<td><b>Contacto : </b><p>${ordenCompra.idProveedor.nombreContacto}</p></td>
							<td><b>Telefono : </b><p>${ordenCompra.idProveedor.telefonoContacto}</p></td>
							<td><b>Correo : </b><p>${ordenCompra.idProveedor.email}</p></td>
							<td colspan="2"><b>Razón Social : </b><p>${ordenCompra.idProveedor.razonSocial}</p></td>
						</tr>
						<tr>
							<th colspan="5" class="text-center"><b>CONTACTO ANDROID & SMART</b></th>
						</tr>
						<tr>
							<td colspan="2"><b>Nombre : </b><p>${ordenCompra.idUsuario.nombre}</p></td>
							<td colspan="1"><b>Correo : </b><p>${ordenCompra.idUsuario.correo}</p></td>
							<td colspan="1"><b>Telefono : </b><p>${ordenCompra.idUsuario.telefono}</p></td>
							<td colspan="1"><b>Celular : </b><p>${ordenCompra.idUsuario.celular}</p></td>
						</tr>
						<tr>
							<th colspan="5" class="text-center"><b>TERMINOS Y CONDICIONES</b></th>
						</tr>
						<tr>
							<td colspan="5"><b>Dirección de Entrega : </b><p>${ordenCompra.direccionEntrega}</p></td>
						</tr>
						<tr>
							<td colspan="3"><b>Condición de Pago : </b><p>${ordenCompra.idProveedor.condicionPago}</p></td>
							<td colspan="2"><b>Moneda : </b><p>${ordenCompra.idProveedor.tipoMoneda}</p></td>
						</tr>
						<tr>
							<td colspan="5"><b>OBSERVACIONES : </b><p class="dblock">${ordenCompra.observaciones}</p></td>
						</tr>
					</table>
					<table id="TableSolicitudes" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
					    <thead>
					        <tr>
					            <th>N° PROD. PROVEEDOR</th>
					            <th>DESCRIPCIÓN</th>
					            <th>PRODUCTO</th>
					            <th>UM</th>
					            <th>CANTIDAD</th>
					            <th>FECHA DE ENTREGA</th>
					            <th>TOTAL</th> 
					        </tr>
					    </thead>
					    <tfoot>
					        <tr>
					            <th>N° PROD. PROVEEDOR</th>
					            <th>DESCRIPCIÓN</th>
					            <th>PRODUCTO</th>
					            <th>UM</th>
					            <th>CANTIDAD</th>
					            <th>FECHA DE ENTREGA</th>
					            <th>TOTAL</th> 
					        </tr>
					    </tfoot>
					    <tbody>
					    </tbody>
					</table>
					<table class="table table-bordered footerOrdenCompra">
						<tr>
						      <th rowspan="3" scope="rowgroup"><b>IMPORTANTE : </b><p style="display:block">- Para la entrega de mercaderia o ejecución del servicio
						      es indispensable la presentacion de este documento. <br/>- El numero de este documento debe figurar en la Guía de Remision y en la factura. <br/>
						      - Para la aceptación de la factura emitida por el proveedor debera adjuntar copia de este documento y la Guía de Remision.  <br/><b>NO SOMOS RESPONSABLES 
						      POR DEMORA DEL PAGO POR ERROR DOCUMENTARIO DEL PROVEEDOR.</b></p></th>
						      <th scope="row"><b>SUB-TOTAL</b></th>
						      <td><b>S/.${ordenCompra.subtotal}</b></td>
						</tr>
						<tr>
						      <th scope="row"><b>IGV</b></th>
						      <td><b>S/.${ordenCompra.IGV}</b></td>
						</tr>
						<tr>
						      <th scope="row"><b>TOTAL</b></th>
						      <td><b>S/.${ordenCompra.total}</b></td>
						</tr>
					</table>
	    		</div>
	    	</div>
	    
	    </div>
	  </main>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="plugins/jquery/jquery-3.2.1.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/mdl/material.min.js"></script>
<script src="plugins/MDB/js/mdb.min.js"></script>
<script src="plugins/MDB/js/popper.min.js"></script>
<script src="plugins/select2/js/select2.min.js"></script>
<script src="plugins/datepicker/js/bootstrap-datepicker.js"></script>
<script src="plugins/js/jquery.dataTables.min.js"></script>
<script src="plugins/js/dataTables.bootstrap4.min.js"></script>
<script>
$(document).ready(function() {
	$('#txtBienvenido').text("Nueva Orden de Compra");
	tableDetallesS = $('#TableSolicitudes').DataTable();
	var idOrden = ${ordenCompra.idOrdenCompra};
	buildTable(idOrden);
});
function buildTable(idOrden){
	$.ajax({
 		url: 'getListaDetallexOrden-'+idOrden,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(detallexorden){
 	 		if(detallexorden.length==0){
 	 			tableDetallesS.clear().draw();
 	 		}else{
 	 	 		console.log(detallexorden);
 			$.each (detallexorden , function (i ,detalle){
 				tableDetallesS.row.add([detalle.codigoProveedorProducto,detalle.descripcion
 				        				,detalle.nombreProducto,'${ordenCompra.idProveedor.tipoMoneda}',detalle.cantidad,detalle.fecha,'S/.'+detalle.precioTotal,
 				        				]).draw(false);
	 				});
	 	 		}
 			}
 		});		
		
	}
</script>
</body>
</html>