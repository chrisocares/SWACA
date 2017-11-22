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
<link rel="stylesheet" href="plugins/MDB/css/bootstrap.min.css" type="text/css">
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
			    			<div class="row">
			    				<div class="col">
			    					<h5><b>Fecha Elaborada</b></h5>
			    					<p id="txtFechaElaborada"></p>
			    				</div>
			    				<div class="col">
			    					<h5><b>Dirección de entrega</b></h5>
			    					<p id="txtDireccion"></p>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col">
			    					<h5><b>Proveedor</b></h5>
			    					<p id="txtProveedor"></p>
			    				</div>
			    				<div class="col">
			    					<h5><b>Estado de Orden de Compra</b></h5>
			    					<p id="txtEstadoOC"></p>
			    				</div>
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
							            <th></th>
							            <th></th>
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
          <h4 class="modal-title"> Movimientos de la Orden de Compra</h4>
        </div>
        <div class="modal-body">
        <form class="form-horizontal" role="form">
				<table id="tableLOG" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>N°</th>
				            <th>Fecha</th>
				            <th>Producto</th>
				            <th>Cantidad Total</th>
				            <th>Cantidad FISICO</th>
				            <th>Descripción</th>
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
<div class="modal fade" id="listInventarioFisico"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header light-blue darken-3 white-text">
                <h4 class="title">Registre el inventario del Pedido</h4>
                <button type="button" class="close waves-effect waves-light" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body">
            <table id="muestraDetallesSolicitud" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp container-fluid">
			  <thead>
			    <tr>
			      <th style="text-align:left">Producto</th>
			      <th style="text-align:center">Cantidad</th>
			      <th style="text-align:left"></th>
			    </tr>
			  </thead>
			  <tbody>
			  </tbody>
			</table>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>  
</div>
    <div class="modal fade" id="finalizarOrdenCompraMODAL" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Cerrar Orden de Compra</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Estas seguro de cerrar esta Orden de compra ? si selecciona aceptar ya no se podra editar la orden.</p>
                    </div>
                </div>
    
                <!--Footer-->
                <div class="modal-footer justify-content-center">
                    <a type="button" class="btn btn-primary-modal" onclick="cerrarOrden()">Aceptar <i class="fa fa-check ml-1"></i></a>
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Cerrar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
<script src="plugins/MDB/js/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="plugins/jquery/jquery-3.2.1.js"></script>
<script src="plugins/MDB/js/bootstrap.min.js"></script>
<script src="plugins/mdl/material.min.js"></script>
<script src="plugins/MDB/js/mdb.min.js"></script>
<script src="plugins/select2/js/select2.min.js"></script>
<script src="plugins/datepicker/js/bootstrap-datepicker.js"></script>
<script src="plugins/js/jquery.dataTables.min.js"></script>
<script src="plugins/js/dataTables.bootstrap4.min.js"></script>

<script>
var Total;
var arrayListos = [];
var arrayPendientes = [];
$('#txtBienvenido').text("Administrar Orden de Compra");
$('.select').select2();
var select_val;
var correoProveedor; 
tableLOG = $('#tableLOG').DataTable();
tableDetallesS = $('#TableDetalleOrdenCompra').DataTable();
$(document).ready(function(){
	$('.dropdown-toggle').dropdown()
	initSelect();
	$('#datosOrdenCompra').css('display','none');
	$('#actionOrdenCompra').css('display','none');
	$('#tableDetallesxOrden').css('display','none');
	$('#TableDetalleOrdenCompra_length label').after('<button type="button" class="m-l-15 btnListInventario btn btn-info" data-toggle="modal" data-target="#listInventarioFisico"><i class="fa fa-pencil-square-o fa-sm pr-2"></i> REGISTRAR INVENTARIO </button>');
	$('.btnListInventario').after('<button id="btnCerrarOrden" data-toggle="modal" data-target="#finalizarOrdenCompraMODAL" type="button" class="btn btn-danger" ><i class="fa fa-check fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>Finalizar</button>');
    $('#btnCerrarOrden').after(
		    '<button id="btnprueba" class="m-l-15 btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-text-o fa-sm pr-2"></i> Orden de Compra</button>'+
		    '<div class="dropdown-menu">'+
		        '<a class="dropdown-item" href="#" onclick="verOrden()"><i class="fa fa-file-text-o fa-sm pr-2" style="color:black;margin-right:7px;"></i>Ver Orden</a>'+
		        '<div class="dropdown-divider"></div>'+
		        '<a class="dropdown-item" href="#" onclick="generarReporte()"><i class="fa fa-file-pdf-o  fa-sm pr-2 " style="color:black;margin-right:7px;"></i>Generar PDF</a>'+
		        '<div class="dropdown-divider"></div>'+
		        '<a class="dropdown-item" href="#" onclick="enviarEmail()"><i class="fa fa-envelope-o  fa-sm pr-2 " style="color:black;margin-right:7px;"></i>Enviar Orden</a>'+
		    '</div>'
		    );
   $('#TableDetalleOrdenCompra_wrapper div:first-child div:first-child').removeClass("col-md-6").addClass("col-md-9");
   $('#TableDetalleOrdenCompra_wrapper div:first-child div:last-child').removeClass("col-md-6").addClass("col-md-3");
   $('#TableDetalleOrdenCompra_length').removeClass("col-md-9");
   $('#TableDetalleOrdenCompra_length').addClass("col-md-12");
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
	 		      	$('#selectOrdenCompra').append('<option id="select2OrdenCompra_'+item.idOrdenCompra+'" value="'+item.idOrdenCompra+'">'+'Orden #'+item.idOrdenCompra+" - "+item.nombreProveedor+" , "+item.fecha+'</option>');
	 		    });
 			}
 		});
}

function poblarCamposxOrden(select_val){
	arrayListos.length = 0;
	arrayPendientes.length=0;
	$.ajax({
 		url: 'getOrdenCompraByID-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(datos){
 			$('#txtFechaElaborada').text(datos.fecha);
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
 				if(detalle.estado=="TOTALMENTE ATENDIDO"){
 	 				tableDetallesS.row.add([detalle.idSolicitud,detalle.nombreProducto,"",detalle.descripcion
 	 				                        ,detalle.fecha,detalle.estado,detalle.cantidad,'S/.'+detalle.precioTotal,
 	 				                     	'<button  data-toggle="modal" data-target="#LOG" id="log-'+detalle.idDetalleSolicitudCompra+'" class="btnLOG mdl-button mdl-js-button mdl-button--icon">'+
  											'<i class="fa fa-history fa-sm pr-2"></i>'+
  											'</button>',
 	 				                        '<i class="fa fa-check-square-o iconTableCenter" style="color:green"></i>'
 	 				        				]).draw(false);
 	 				var arreglo ={row1: detalle.idDetalleSolicitudCompra};
 	 				arrayListos.push(arreglo);
 				}else{
 				tableDetallesS.row.add([detalle.idSolicitud,detalle.nombreProducto,"",detalle.descripcion
 				                       ,detalle.fecha,detalle.estado,detalle.cantidad,'S/.'+detalle.precioTotal,
 				                      '<button  data-toggle="modal" data-target="#LOG" id="log-'+detalle.idDetalleSolicitudCompra+'" class="btnLOG mdl-button mdl-js-button mdl-button--icon">'+
 										'<i class="fa fa-history fa-sm pr-2"></i>'+
 										'</button>',
 										'<i class="fa fa-road iconTableCenter" style="color:red"></i>'
 				        				]).draw(false);
	 				var arreglo ={row1: detalle.idDetalleSolicitudCompra};
 	 				arrayPendientes.push(arreglo);
 						}
	 				});
	 	 		}
	 	 		var Total = detallexorden.length;
	 	 		var Listos = arrayListos.length;
	 	 		var Pendientes = arrayPendientes.length;
	 	 		if(Pendientes >0){
	 	 			$('#btnCerrarOrden').prop("disabled", true);
	 	 		}else if (Total = Listos){
	 	 			$('#btnCerrarOrden').prop("disabled", false);
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

function buildTableLOG(id){
	$.ajax({
 		url: 'getLOGxDetalle-'+id,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(logs){
 			$.each (logs , function (i ,log){
 				tableLOG.row.add([log.idLog,log.fecha,log.producto,log.cantidad,log.cantidadActual,log.descripcion]).draw(false);
 				});
 			}
 		});
	}

$(document).on('click','.btnLOG',function(e){
	var id =this.id.slice(4,this.id.length);
	tableLOG.clear().draw();
	buildTableLOG(id);
});
$(document).on('click','.btnListInventario',function(e){
	$('#muestraDetallesSolicitud tbody').empty();
	$.ajax({
 		url: 'getListaDetallexOrden-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(detallesolicitudes){
 			$.each (detallesolicitudes , function (i ,detallesolicitud){
  	 			$('#listInventarioFisico tbody').append(
	 					'<tr><td style="text-align:left">'+detallesolicitud.nombreProducto+'</td>'+
	 					'<td style="text-align:center"><input style="width:50%" value="'+detallesolicitud.cantidad+'" readonly class="text-center" type="number"> / <input style="width:50%" id="inputCantidad-'+detallesolicitud.idDetalleSolicitudCompra+'"readonly class="text-center" type="number" min="0" max="'+detallesolicitud.cantidad+'" value="'+detallesolicitud.cantidadRegistrada+'"></td>'+
	 					'<td style="text-align:left">'+
	 					'<button  id="modifyDetalleSolicitud-'+detallesolicitud.idDetalleSolicitudCompra+'" class="btnmodifyDetalleSolicitud mdl-button mdl-js-button mdl-button--icon">'+
						'<i class="fa fa-cog"></i>'+
						'</button>'+
	 					'<button  id="saveCantidadDetalleSolicitud-'+detallesolicitud.idDetalleSolicitudCompra+'" class="btnmodifyCantidad mdl-button mdl-js-button mdl-button--icon" style="display:none">'+
						'<i class="fa fa-floppy-o"></i>'+
						'</button>'+
	 					'</td>'+
	 					'</tr>');
 					});
	 	 		}
 		});
});

$(document).on('click','.btnmodifyDetalleSolicitud',function(e){
	idModificarCantidad=this.id.slice(23,this.id.length);
	document.getElementById(this.id).style.display = 'none';
	document.getElementById("saveCantidadDetalleSolicitud-"+idModificarCantidad).style.display = 'block';
	$("#inputCantidad-"+idModificarCantidad).attr("readonly", false);
});  

$(document).on('click','.btnmodifyCantidad',function(e){
	idModificarCantidad=this.id.slice(29,this.id.length);
	var can = $('#inputCantidad-'+idModificarCantidad).val();
	document.getElementById(this.id).style.display = 'none';
	document.getElementById("modifyDetalleSolicitud-"+idModificarCantidad).style.display = 'block';
	updateCantidad(can);
});

function updateCantidad(cantidad){
	$.ajax({
 		url: 'updateCantidadRegistradaDetalle-'+idModificarCantidad+'-'+cantidad,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});
}

$("#listInventarioFisico").on("hide.bs.modal", function () {
	tableDetallesS.clear().draw();
	poblarCamposxOrden(select_val);
});

function cerrarOrden(){
	$.ajax({
 		url: 'updateEstadoOrdenCompra-'+select_val+'-2',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});
	$('#myLargeModal').modal('toggle');
	location.reload();
}
</script>
</body>
</html>