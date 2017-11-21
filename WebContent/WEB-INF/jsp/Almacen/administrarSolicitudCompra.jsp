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
		    			<h1 class="display-3">Administrar Solicitudes de Compras</h1>
			        	<p>Para crear una nueva orden de Compra seleccione el boton , RECUERDE que solo podran ser seleccionados las solicitudes de estado 'SOLICITADO'.</p>
			        	<p><a class="btn btn-primary btn-lg" href="#" role="button" data-toggle="modal" data-target="#myLargeModal">CREAR NUEVA ORDEN &raquo;</a></p>
		    		</div>
		    	</div>
				<table id="TableSolicitudes" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>N° Solicitud Compra</th>
				            <th>Tienda</th>
				            <th>Descripcion</th>
				            <th>Fecha de Registro</th>
				            <th>Fecha de Entrega</th>
				            <th>Estado</th>
				            <th></th>
				        </tr>
				    </thead>
				    <tfoot>
				        <tr>
				            <th>N° Solicitud Compra</th>
				            <th>Tienda</th>
				            <th>Descripcion</th>
				            <th>Fecha de Registro</th>
				            <th>Fecha de Entrega</th>
				            <th>Estado</th>
				            <th></th>
				        </tr>
				    </tfoot>
				    <tbody>
				    </tbody>
				</table>
	    	</div>
	    </div>
	  </main>
	</div>
<!-- Modal -->
  <div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="myLargeModalLabel"></h4>
        </div>
        <div class="modal-body">
        <form class="form-horizontal" role="form">
        	<div class="form-group">
        		<label class="col-sm-12">Proveedor</label>
        		<div class="col-sm-12">
        			<select class="select" id="selectProveedor" name="state">
			  			<option value="init">Seleccione un Proveedor ...</option>
					</select>
        		</div>
        	</div>
        	<div id="afterSelect">
	        	<div class="form-group col-sm-6">
	        	    <label>Condición de Pago</label>
	        	    <div>
	        			<input type="text" class="form-control" 
	                        id="txtcondicionPago" readonly/>
	        		</div>
	        	</div>
	        	<div class="form-group col-sm-2">
	        	    <label class="col-sm-12">Moneda</label>
	        	    <div class="col-sm-12">
	        			<input type="text" class="form-control" 
	                        id="txtmoneda" readonly/>
	        		</div>
	        	</div>
	        	<div class="form-group col-sm-5">
	        	    <label>Grupo de Pago</label>
	        	    <div>
	        			<input type="text" class="form-control" 
	                        id="txtgrupopago" readonly/>
	        		</div>
	        	</div>
	        	<div class="form-group">
	        	    <label class="col-sm-12">Dirección de Entrega</label>
	        	    <div class="col-sm-12">
	        			<input type="text" class="form-control" 
	                        id="txtdireccion" placeholder="Escriba la dirección de entrega"/>
	        		</div>
	        	</div>
	        </div>
        	<div class="md-form" style="width:100%">
        		<div>
				    <textarea type="text"  id="txtobservaciones" class="md-textarea"></textarea>
				    <label for="form7">Observaciones</label>
				</div>
        	</div>
        	</form>	
        	<table id="TableDetallesSolicitudes" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
				    <thead>
				        <tr>
				            <th>N° Detalle Solicitud</th>
				            <th>N° Solicitud de Compra</th>
				            <th>Cantidad</th>
				            <th>Producto</th>
				            <th>Descripcion</th>
				            <th>Fecha de Registro</th> 
				            <th>Total</th>    
				            <th></th>         
				        </tr>
				    </thead>
				    <tbody>
				    </tbody>
			</table>
		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="OrdenCompra()">Generar Orden</button>
        </div>
      </div>
	</div>
</div>
    <div class="modal fade" id="modalCamposVacios" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
            <!--Content-->
            <div class="modal-content text-center">
                <!--Header-->
                <div class="modal-header d-flex justify-content-center">
                    <p class="heading" id="modalMensajeError"></p>
                </div>

                <!--Body-->
                <div class="modal-body">

                    <i class="fa fa-times fa-4x animated rotateIn"></i>

                </div>

                <!--Footer-->
                <div class="modal-footer flex-center">
                    <a class="btn  btn-outline-secondary-modal" data-dismiss="modal">Aceptar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
    <div class="modal fade" id="RegistradoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-warning" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Orden de Compra Registrada</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p id="mensajeModalRegistro"></p>
                    </div>
                </div>
    
                <!--Footer-->
                <div class="modal-footer justify-content-center">
                	<a type="button" class="btn btn-primary-modal" onClick="irOrden()">Ver Orden de Compra<i class="fa fa-file-text-o ml-1"></i></a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>  
<div class="modal fade" id="detallexsolicitudModal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document" style="width:644px !important;">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header light-blue darken-3 white-text">
                <h4 class="title" id="titleVerSolicitud"></h4>
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
			      <th style="text-align:left">Descripcion</th>
			      <th style="text-align:left">Cantidad</th>
			      <th style="text-align:left"></th>
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
<!-- Modal Eliminar Item de Lista -->
    <div class="modal fade" id="deleteItemDetalleSolicitud" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Eliminar de la Solicitud de Lista</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Estas seguro de eliminar este detalle de la Lista ?</p>
                    </div>
                </div>
    
                <!--Footer-->
                <div class="modal-footer justify-content-center">
                    <a type="button" class="btn btn-primary-modal" id="aceptardeleteItemDetalleSolicitud">Aceptar <i class="fa fa-trash ml-1"></i></a>
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Cerrar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
    <div class="modal fade" id="deleteSolicitud" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Eliminar Solicitud</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Estas seguro de eliminar esta solicitud ?</p>
                    </div>
                </div>
    
                <!--Footer-->
                <div class="modal-footer justify-content-center">
                    <a type="button" class="btn btn-primary-modal" id="aceptardeleteSolicitud">Aceptar <i class="fa fa-trash ml-1"></i></a>
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Cerrar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
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
var idModificarCantidad;
var arrayItemsOrden = [];
var idProveedorO;
var numeroOrden;
var idSolicitudSeleccionadobtnVer; 
var idRemover;
var selOtroProducto;
$(document).ready(function() {
	
	$('#txtBienvenido').text("Administrar Solicitudes de Compra");
    tableSolicitudes = $('#TableSolicitudes').DataTable();
    tableDetallesS = $('#TableDetallesSolicitudes').DataTable();
    buildTableSolicitudes();
    $('[name=TableSolicitudes_length]').addClass('mdb-select');
    $('.select').select2();
	$.ajax({
 		url: 'getListProveedor',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(proveedores){
 			initSelectProveedores(proveedores);
 			}
 		});

	$.ajax({
 		url: 'getNumeroOrden',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(numero){
 	 		$('#myLargeModalLabel').text("Nueva Orden de Compra "+numero);
 	 		$('#txtdireccion').val('Chorrillos , Av. Cedros de Villa');
 	 		numeroOrden = numero;
 			}
 		});	
});
function setModalMaxHeight(element) {
	  this.$element     = $(element);  
	  this.$content     = this.$element.find('.modal-content');
	  var borderWidth   = this.$content.outerHeight() - this.$content.innerHeight();
	  var dialogMargin  = $(window).width() < 768 ? 20 : 60;
	  var contentHeight = $(window).height() - (dialogMargin + borderWidth);
	  var headerHeight  = this.$element.find('.modal-header').outerHeight() || 0;
	  var footerHeight  = this.$element.find('.modal-footer').outerHeight() || 0;
	  var maxHeight     = contentHeight - (headerHeight + footerHeight);
	  this.$content.css({
	      'overflow': 'hidden'
	  });
	  
	  this.$element
	    .find('.modal-body').css({
	      'max-height': maxHeight,
	      'overflow-y': 'auto'
	  });
	}
	$('.modal').on('show.bs.modal', function() {
	  $(this).show();
	  setModalMaxHeight(this);
	});
	$(window).resize(function() {
	  if ($('.modal.in').length != 0) {
	    setModalMaxHeight($('.modal.in'));
	  }
	});
	
function buildTableSolicitudes(){
	$.ajax({
 		url: 'getSolicitudesCompra-1',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(solicitudesCompra){
 			$.each (solicitudesCompra , function (i ,solicitudCompra){
 				console.log(solicitudCompra.fechaEntrega1);
 				tableSolicitudes.row.add([solicitudCompra.idSolicitudCompra,solicitudCompra.descripcionTienda,solicitudCompra.descripcion,
 				              solicitudCompra.fechaRegistro1,solicitudCompra.fechaEntrega,solicitudCompra.descripcionEstado,
 				              '<button  id="verSolicitud-'+solicitudCompra.idSolicitudCompra+'" data-toggle="modal" data-target="#detallexsolicitudModal" class="btnVerSolicitud mdl-button mdl-js-button mdl-button--icon">'+
								'<i class="fa fa-list-ul" aria-hidden="true"></i>'+
									'</button>'+
							  '<button  id="eliminarSolicitud-'+solicitudCompra.idSolicitudCompra+'" data-toggle="modal" data-target="#deleteSolicitud" class="btnEliminarSolicitud mdl-button mdl-js-button mdl-button--icon">'+
								'<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>'+
									'</button>']).draw(false);
 				});
 			}
 		});
		
	}
	
function initSelectProveedores(proveedores){
    $.each(proveedores, function(i, proveedor) {	
    	var data=proveedor.tratamiento+" - "+proveedor.nombreComercial+" - "+proveedor.razonSocial;
    	$('#selectProveedor').append('<option id="select2_'+proveedor.idProveedor+'" value="'+proveedor.idProveedor+'">'+data+'</option>');
    });
}
function buildTableDetallesxProveedor(idProveedor){
	$.ajax({
 		url: 'getSolicitudesbyProveedor-'+idProveedor,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(detallesolicitudes){
 	 		if(detallesolicitudes.length==0){
 	 			tableDetallesS.clear().draw();
 	 		}else{
 			$.each (detallesolicitudes , function (i ,detallesolicitud){
 				tableDetallesS.row.add([detallesolicitud.idDetalleSolicitudCompra,detallesolicitud.codigo,detallesolicitud.cantidad
 				        				,detallesolicitud.nombreProducto,detallesolicitud.descripcion,detallesolicitud.fecha,'S/.'+detallesolicitud.precioTotal,
 				        				'<button  id="addOrden-'+detallesolicitud.idDetalleSolicitudCompra+'" class="btnAddOrden mdl-button mdl-js-button mdl-button--icon">'+
 										'<i class="glyphicon glyphicon-plus"></i>'+
 										'</button>'+
 										'<button  id="removeOrden-'+detallesolicitud.idDetalleSolicitudCompra+'" class="btnremoveOrden mdl-button mdl-js-button mdl-button--icon" style="display:none">'+
 										'<i class="glyphicon glyphicon-trash"></i>'+
 										'</button>'
 				        				]).draw(false);
	 				});
	 	 		}
 			}
 		});
		
	}
$('#selectProveedor').select2().on("change", function(e) {
    var select_val = $(e.currentTarget).val();
    if(select_val=='init'){
    	tableDetallesS.clear().draw();
    	$('#afterSelect').hide();
    }else{
        idProveedorO = select_val;
    	$('#afterSelect').show();
        setDatosProveedor(select_val);
    	tableDetallesS.clear();
    	buildTableDetallesxProveedor(select_val);
    	arrayItemsOrden.length=0;
    }
  });
$(document).on('click','.btnAddOrden',function(e){
	var idSelectTrash=this.id.slice(9,this.id.length);
	$('#'+this.id).parent().parent().css('background','yellow');
	document.getElementById(this.id).style.display = 'none';
	document.getElementById("removeOrden-"+idSelectTrash).style.display = 'block';
	var arreglo = {row1:idSelectTrash};
	arrayItemsOrden.push(arreglo);
});
$(document).on('click','.btnremoveOrden',function(e){
	var idAdd=this.id.slice(12,this.id.length);
	$('#'+this.id).parent().parent().css('background','white');
	document.getElementById(this.id).style.display = 'none';
	document.getElementById("addOrden-"+idAdd).style.display = 'block';
	for(var a = 0; a < arrayItemsOrden.length; a++) {
	    for(var b in arrayItemsOrden[a]) {
	        if(arrayItemsOrden[a].row1 === idAdd) {
	        	arrayItemsOrden.splice(a, 1);
	            a--;
	            break;
	        }
	    }
	}
});

function OrdenCompra(){
	if($('#txtdireccion').val().length==0||$('#txtobservaciones').val().length==0){
		$('#modalMensajeError').text('Complete los campos');
		$('#modalCamposVacios').modal('show'); 
		}else if(arrayItemsOrden.length==0||arrayItemsOrden===undefined){
			$('#modalMensajeError').text('Debe agregar almenos 1 Detalle de Solicitud');
			$('#modalCamposVacios').modal('show'); 
		}else{
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1;
			var yyyy = today.getFullYear();
			var fecha = mm+"/"+dd+"/"+yyyy;
			for(var i=0;i<3;i++){
				fecha = fecha.replace("/","&");
			}
			var IGV;	
			var sumaSubTotal = 0;

			var Total;
			var direccion = $('#txtdireccion').val();
			var observaciones =  $('#txtobservaciones').val();
			for(var i = 0 ; i<arrayItemsOrden.length ; i++){
				var id = arrayItemsOrden[i].row1;
				$.ajax({
			 		url: 'getByIdDetalleSolicitud-'+id,
			 		type: 'post',
			 		dataType: 'json',
			 		data: '',
			 		async:false,
			 		success: function(detalle){
				 		sumaSubTotal += detalle.precioTotal; 
			 			SubTotal = sumaSubTotal;
			 			}
			 		});		
			}

			IGV = (SubTotal*18)/100;
			Total = IGV + SubTotal;
			$.ajax({
		 		url: 'createOrdenCompra-'+direccion+'-'+fecha+'-'+${Usuario.idUsuario}+'-'+SubTotal+'-'+Total+'-'+observaciones+'-'+idProveedorO,
		 		type: 'post',
		 		dataType: 'json',
		 		data: '',
		 		success: function(){

		 			}
		 		});
			for(var i = 0 ; i<arrayItemsOrden.length ; i++){
				var idDetalle = arrayItemsOrden[i].row1;
				$.ajax({
			 		url: 'createDetallexOrden-'+idDetalle+'-'+fecha+'-'+numeroOrden+'-'+Total,
			 		type: 'post',
			 		dataType: 'json',
			 		data: '',
			 		success: function(){
			 			}
			 		});
				$.ajax({
			 		url: 'updateEstadoDetalle-'+idDetalle+'-2',
			 		type: 'post',
			 		dataType: 'json',
			 		data: '',
			 		success: function(){
			 			}
			 		});
			}
	 		$('#myLargeModal').modal('toggle'); 
			$('#mensajeModalRegistro').text("La Orden de compra fue generado exitosamente ! ")
			setTimeout($('#RegistradoModal').modal('show'), 300);
			
			}	
}

$("#RegistradoModal").on("hide.bs.modal", function () {
	location.reload();
});

function setDatosProveedor(select_val){
	$.ajax({
 		url: 'getByidProveedor-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(proveedor){
 			$('#txtcondicionPago').val(proveedor.condicionPago);
 			$('#txtmoneda').val(proveedor.tipoMoneda);
 			$('#txtgrupopago').val(proveedor.grupoPago);
 			}
 		});
}

function irOrden(){
	window.location = 'http://localhost:8080/SWACA/viewOrdenCompra-'+numeroOrden;
}

$(document).on('click','.btnVerSolicitud',function(e){
	idSolicitudSeleccionadobtnVer=this.id.slice(13,this.id.length);
	$('#titleVerSolicitud').text("Solicitud N° "+idSolicitudSeleccionadobtnVer);
	$('#muestraDetallesSolicitud tbody').empty();
	initSelectDetallebySolicitud(idSolicitudSeleccionadobtnVer);
});


function initSelectDetallebySolicitud(idSolicitud){
	$.ajax({
 		url: 'getSolicitudesbySolicitud-'+idSolicitud,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(detallesolicitudes){
 			$.each (detallesolicitudes , function (i ,detallesolicitud){
 	 			var data = detallesolicitud.descripcion +" - " +detallesolicitud.nombreProducto;
 	 			$('#muestraDetallesSolicitud tbody').append(
	 					'<tr id="trmuestraDetalle-'+detallesolicitud.idDetalleSolicitudCompra+'"><td style="text-align:left"">'+
	        			'<select disabled class="form-control form-control-sm selectOtroProducto" id="selectOtroProducto-'+detallesolicitud.idDetalleSolicitudCompra+'" name="ds" style="width:220px">'+
			  			'<option value="init" selected>'+detallesolicitud.nombreProducto+'</option>'+
						'</select>'
	 					+'</td>'+
	 					'<td style="text-align:left">'+detallesolicitud.descripcion+'</td>'+
	 					'<td style="text-align:left"><input id="inputCantidad-'+detallesolicitud.idDetalleSolicitudCompra+'"readonly class="text-center" type="number" min="0" value="'+detallesolicitud.cantidad+'"></td>'+
	 					'<td style="text-align:left">'+
	 					'<button  data-toggle="modal" data-target="#deleteItemDetalleSolicitud" id="removeDetalleSolicitud-'+detallesolicitud.idDetalleSolicitudCompra+'" class="btnremoveDetalleSolicitud mdl-button mdl-js-button mdl-button--icon">'+
						'<i class="glyphicon glyphicon-trash"></i>'+
						'</button>'
	 					+'</td>'+
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
}
  
$(document).on('click','.btnmodifyDetalleSolicitud',function(e){
		idModificarCantidad=this.id.slice(23,this.id.length);
		document.getElementById(this.id).style.display = 'none';
		document.getElementById("saveCantidadDetalleSolicitud-"+idModificarCantidad).style.display = 'block';
		$("#inputCantidad-"+idModificarCantidad).attr("readonly", false);
		initSelectOtroProducto();
		$('#selectOtroProducto-'+idModificarCantidad).prop('disabled',false);
});  
$(document).on('click','.btnremoveDetalleSolicitud',function(e){
	idModificarCantidad=this.id.slice(23,this.id.length);

});  
$('#aceptardeleteItemDetalleSolicitud').click(function() {
	$('#trmuestraDetalle-'+idModificarCantidad).remove();
	$.ajax({
 		url: 'updateEstadoDetalle-'+idModificarCantidad+'-7',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});
	$('#deleteItemDetalleSolicitud').modal('toggle');
});
$(document).on('click','.btnmodifyCantidad',function(e){
	idModificarCantidad=this.id.slice(29,this.id.length);
	var can = $('#inputCantidad-'+idModificarCantidad).val();
	updateCantidad(can,selOtroProducto);
	document.getElementById(this.id).style.display = 'none';
	document.getElementById("modifyDetalleSolicitud-"+idModificarCantidad).style.display = 'block';

});
function updateCantidad(cantidad,idProducto){
	$.ajax({
 		url: 'updateCantidadDetalle-'+idModificarCantidad+'-'+cantidad+'-'+idProducto,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});
}
$(document).on('click','.btnEliminarSolicitud',function(e){
	idRemover=this.id.slice(18,this.id.length);
});

$('#aceptardeleteSolicitud').click(function() {
	$.ajax({
 		url: 'updateEstadoSolicitud-'+idRemover+'-3',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		async: false,
 		success: function(){
 			}
 		});
	$('#deleteSolicitud').modal('toggle');
	tableSolicitudes.clear().draw();
	buildTableSolicitudes();
	
});

function initSelectOtroProducto(){
	$.ajax({
 		url: 'getProductos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(productos){
 		    $.each(productos, function(i, producto) {	
 		    	var data=producto.nombreLista;
 		    	$('#selectOtroProducto-'+idModificarCantidad).append('<option id="select2_'+producto.idProducto+'" value="'+producto.idProducto+'">'+data+'</option>');
 		    });
 			}
 		});		
}

$(document).on('change', '.selectOtroProducto', function() {
	    
		var selected = $("#selectOtroProducto-"+idModificarCantidad+" option:selected").val();
	    console.log(selected);
	    if(selected == "init"){
	    	selOtroProducto = "Empty";
	    }else{
	    	selOtroProducto = selected;
	    }
});
</script>
</body>
</html>