<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWACA - Admin. Solicitud de Compra</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Fira+Sans|Roboto:300,400|Questrial|Satisfy">
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="plugins/mdl/material.min.css" type="text/css">
<link rel="stylesheet" href="plugins/MDB/css/mdb.min.css" type="text/css">
<link rel="stylesheet" href="plugins/select2/css/select2.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="plugins/datepicker/css/datepicker.css" type="text/css">
<link rel="stylesheet" href="plugins/css/dataTables.bootstrap4.min.css" type="text/css">
<link rel="stylesheet" href="css/administrarSolicitudesCompra.css" type="text/css">
<link rel="stylesheet" href="css/general.css" type="text/css">
<link rel="stylesheet" href="plugins/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
	  <jsp:include page="../Almacen/PageMasterAlmacen.jsp"></jsp:include>
	  <main class="mdl-layout__content">
	    <div class="page-content"><!-- Your content goes here -->
			<div class="container" id="administrarSolicitudesContainer">
	    		<div style="background-color: #eceeef">
		    		<div class="p-20">
		    			<h1 class="display-3">Administrar Orden de Compra</h1>
			        	<p>Seleccione una orden de compra.</p>
        				<select class="select" id="selectOrdenCompra" name="state">
			  				<option value="init">Seleccione una Orden de Compra ...</option>
						</select>
		    		</div>
		    	</div>
		    	<div>
		    		<div id="datosOrdenCompra" class="col-sm-12" style="border:1px solid">
		    				<h5><b>Observaciones</b></h5>
		    				<p>${ordenCompraBean.observaciones}</p>
			    			<div class="form-group">
			    				<div class="col-sm-6">
			    					<h5><b>Fecha Elaborada</b></h5>
			    					<p id="txtFechaElaborada"></p>
			    				</div>
			    				<div class="col-sm-6">
			    					<h5><b>Dirección de entrega</b></h5>
			    					<p id="txtDireccion"></p>
			    				</div>
			    			</div>
			    			<div class="form-group">
			    				<div class="col-sm-6">
			    					<h5><b>Proveedor</b></h5>
			    					<p id="txtProveedor"></p>
			    				</div>
			    				<div class="col-sm-6">
			    					<h5><b>Estado de Orden de Compra</b></h5>
			    					<p id="txtEstadoOC"></p>
			    				</div>
			    			</div>
		    			</div>
		    			<div id="actionOrdenCompra" class="container">
		    				<div class="btn-group container m-t-15" role="group" aria-label="Basic example">
							    <button type="button" class="btn btn-outline-mdb-color waves-effect" onclick="verOrden()"><i class="fa fa-file-text-o  fa-sm pr-2 btnGroupAction" aria-hidden="true"></i> Ver Orden de Compra</button>							   
							    <button type="button" class="btn btn-outline-mdb-color waves-effect" onclick="generarReporte()"><i class="fa fa-file-pdf-o  fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>Generar PDF</button>
							    <button type="button" class="btn btn-outline-mdb-color waves-effect" onclick="enviarEmail()"><i class="fa fa-envelope-o fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>Enviar Proveedor</button>
								<button type="button" class="btn btn-outline-mdb-color waves-effect"><i class="fa fa-check fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>Finalizar</button>
								<button type="button" class="btn btn-outline-mdb-color waves-effect" data-toggle="modal" data-target="#LOG"><i class="fa fa-history fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>Historial</button>
							</div>
		    			</div>
		    			<div class="container m-t-15" id="tableDetallesxOrden">
		    			<table id="TableDetalleOrdenCompra" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
							    <thead>
							        <tr>
							            <th>#</th>
							            <th>Producto</th>
							            <th>U.M</th>
							            <th>Descripcion</th>
							            <th>Fecha de Registro</th>
							            <th>Estado</th>
							            <th>Cantidad Total</th>
							            <th>Total</th>
							        </tr>
							    </thead>
						    <tbody>
						    </tbody>
						</table>
		    			</div>
		    		</div>
		    	</div>
		    </div>
            <!--/.Content-->
        </div>
    </div>
    <div class="modal fade" id="ModalExito" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-warning" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Orden de Compra enviada Exitosamente !</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p id="mensajeModalRegistro">La orden de Compra fue enviada al proveedor con correo : <b id="correoProveedorMSG"></b> y asunto : <b id="asuntoMSG"></b></p>
                    </div>
                </div>
    
                <!--Footer-->
                <div class="modal-footer justify-content-center">
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Aceptar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
  <div class="modal fade" id="LOG" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"> Movimientos de la Orden de Compra</h4>
        </div>
        <div class="modal-body">
        <form class="form-horizontal" role="form">
				<table id="tableLOG" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>N° Detalle Compra</th>
				            <th>Fecha</th>
				            <th>Producto</th>
				            <th>Cantidad</th>
				            <th></th>
				        </tr>
				    </thead>
				    <tbody>
				    </tbody>
				</table> 		  
		</form>		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
	</div>
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
$('#txtBienvenido').text("Administrar Orden de Compra");
$('.select').select2();
var select_val;
var correoProveedor; 
tableLOG = $('#tableLOG').DataTable();
tableDetallesS = $('#TableDetalleOrdenCompra').DataTable();
buildTableLOG();
$(document).ready(function(){
	initSelect();
	$('#datosOrdenCompra').css('display','none');
	$('#actionOrdenCompra').css('display','none');
	$('#tableDetallesxOrden').css('display','none');
});

$('#selectOrdenCompra').select2().on("change", function(e) {
    select_val = $(e.currentTarget).val();
    if(select_val=='init'){
    	$('#datosOrdenCompra').css('display','none');
    	$('#actionOrdenCompra').css('display','none');
    	$('#tableDetallesxOrden').css('display','none');
    }else{
    	$('#datosOrdenCompra').css('display','block');
    	$('#actionOrdenCompra').css('display','block');
    	$('#tableDetallesxOrden').css('display','block');
    	poblarCamposxOrden(select_val);
    }
  });
  
function initSelect(){
	$.ajax({
 		url: 'listOrdenCompra-1',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(listordenCompra){
	 		    $.each(listordenCompra, function(i, item) {	 
	 		      	$('#selectOrdenCompra').append('<option id="select2OrdenCompra_'+item.idOrdenCompra+'" value="'+item.idOrdenCompra+'">'+'Orden #'+item.idOrdenCompra+" - "+item.nombreProveedor+" , "+item.fechaEmitida+'</option>');
	 		    });
 			}
 		});
}

function poblarCamposxOrden(select_val){
	$.ajax({
 		url: 'getOrdenCompraByID-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(datos){
 			$('#txtFechaElaborada').text(datos.fechaEmitida);
 			$('#txtProveedor').text(datos.nombreProveedor);
 			$('#txtDireccion').text(datos.direccionEntrega);
 			$('#txtEstadoOC').text(datos.nombreestado);
 			correoProveedor = datos.correoProveedor;
 			}
 		});	
	$.ajax({
 		url: 'getListaDetallexOrden-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(detallexorden){
 	 		if(detallexorden.length==0){
 	 			tableDetallesS.clear().draw();
 	 		}else{
 			$.each (detallexorden , function (i ,detalle){
 				tableDetallesS.row.add([detalle.idSolicitud,detalle.nombreProducto,"",detalle.descripcion
 				                       ,detalle.fechaRegistro,detalle.estado,detalle.cantidad,'S/.'+detalle.precioTotal,
 				        				]).draw(false);
	 				});
	 	 		}
 			}
 		});	
}

function verOrden(){
	window.location = 'http://localhost:8080/SWACA/viewOrdenCompra-'+select_val;
}

function generarReporte(){
	$.ajax({
 		url: 'GenerarReporte-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});	
}

function enviarEmail(){
	$.ajax({
 		url: 'GenerarReporte-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});	
	$.ajax({
		url: 'sendEmail-'+correoProveedor,
		type: 'post',
		dataType: 'json',
		data: '',
		success: function(){
			}
		});
	var asunto = "ANDROID & SMART - Emision de Orden de Compra";
	$('#correoProveedorMSG').text(correoProveedor);
	$('#asuntoMSG').text(asunto);
	$('#ModalExito').modal('show'); 
}

function buildTableLOG(){
	$.ajax({
 		url: 'getSolicitudesCompra-1',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(logs){
 			$.each (logs , function (i ,log){
 				tableLOG.row.add([]).draw(false);
 				});
 			}
 		});
		
	}

</script>
</body>
</html>