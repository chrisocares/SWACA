<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWACA - Mis Ordenes</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Fira+Sans|Roboto:300,400|Questrial|Satisfy">
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="plugins/selectQuery/css/bootstrap-select.min.css">
<link rel="stylesheet" href="plugins/select2/css/select2.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="plugins/datepicker/css/datepicker.css" type="text/css">
<link rel="stylesheet" href="plugins/css/dataTables.bootstrap4.min.css" type="text/css">
<link rel="stylesheet" href="plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/administrarSolicitudesCompra.css" type="text/css">
<link rel="stylesheet" href="plugins/mdl/material.min.css" type="text/css">
<link rel="stylesheet" href="plugins/MDB/css/mdb.min.css" type="text/css">
<link rel="stylesheet" href="css/general.css" type="text/css">
</head>
<body>
	  <jsp:include page="../Almacen/PageMasterAlmacen.jsp"></jsp:include>
	  <main class="mdl-layout__content">
	    <div class="page-content"><!-- Your content goes here -->
				<div class="container" id="administrarSolicitudesContainer">
		    		<div style="background-color: #E3F0EB; padding: 20px 0px 20px 0px;">
			    		<div class="p-20" style="padding-left: 50px;">
			    			<h2 class="display-3" style="font-weight: bold;">Ordenes de Compra GENERADAS</h2>
			    			<p>Eliga una orden de compra para solicitar el pedido al proveedor.</p>
			    		</div>
			    	</div>
					<!-- Section-->
					<div class="tab-content" style="margin-top: 25px;">
					  	<div id="div-1" class="tab-pane fade in menu1tab active" class="container-fluid" style="padding-bottom: 60px;">
							<table id="TableOrdenCompraGENERADA" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
						        <thead>
						        	<tr style="background-color: #7EEEC1;">
							            <th>#</th>
							            <th>Fecha Emitida</th>
							            <th>Observaciones</th>
							            <th>Emitente</th>
							            <th>Proveedor</th>
							            <th>Estado</th>
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
        <div class="modal fade" id="ModalAceptado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <p id="mensajeModalRegistro">La orden de Compra fue Registrada puede comenzar a registra la llegada de los productos.</p>
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
            <div class="modal fade" id="ModalRechazado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-warning" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Orden de Compra Rechazada</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p id="mensajeModalRegistro">La orden de Compra fue Rechazada por el Proveedor.</p>
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
<script src="plugins/selectQuery/js/bootstrap-select.min.js"></script>

<script>
$('.select').select2();
TableMain = $('#TableOrdenCompraGENERADA').DataTable();
var select_val;
var correoProveedor;
$(document).ready(function() {
	$('#txtBienvenido').text("Orden de Compra Generada");
    $('.js-example-basic-single').select2();
    initTablas();
});

$(document).on('click','.enviarCorreo',function(e){
	select_val=this.id.slice(3,this.id.length);
	enviarEmail(); 
	TableMain.clear().draw();
	initTablas();
});  

$(document).on('click','.btnAceptado',function(e){
	select_val=this.id.slice(3,this.id.length);
	$.ajax({
		url: 'updateEstadoOrdenCompra-'+select_val+'-5',
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(){
			}
		});
	$.ajax({
		url: 'getListaDetallexOrden-'+select_val,
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(data){
			$.each (data , function (i ,itera){
				console.log("#"+itera.idDetalleSolicitudCompra);
				var idDetalle = itera.idDetalleSolicitudCompra;
				updateDetalleEstado(idDetalle,4);
			});
			}
		});

	TableMain.clear().draw();
	$('#ModalAceptado').modal('show'); 
	initTablas();
});  

function updateDetalleEstado(idDetalle,idEstado){
	$.ajax({
		url: 'updateEstadoDetalle-'+idDetalle+'-'+idEstado,
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(){
			}
		});
}
$(document).on('click','.btnRechazado',function(e){
	select_val=this.id.slice(3,this.id.length);
	$.ajax({
		url: 'updateEstadoOrdenCompra-'+select_val+'-4',
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(){
			}
		});
	$.ajax({
		url: 'getListaDetallexOrden-'+select_val,
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(data){
			$.each (data , function (i ,itera){
				console.log("#"+itera.idDetalleSolicitudCompra);
				var idDetalle = itera.idDetalleSolicitudCompra;
				updateDetalleEstado(idDetalle,7);
			});
			}
		});
	TableMain.clear().draw();
	$('#ModalRechazado').modal('show'); 
	initTablas();
});  

function enviarEmail(){
	$.ajax({
 		url: 'GenerarReporte-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		async:false,
 		success: function(){
 			}
 		});	
	$.ajax({
 		url: 'getOrdenCompraByID-'+select_val,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		async:false,
 		success: function(datos){
 			correoProveedor = datos.correoProveedor;
 			}
 		});	
		console.log(correoProveedor);
	$.ajax({
		url: 'sendEmail-'+correoProveedor,
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(){
			}
		});
	$.ajax({
		url: 'updateEstadoOrdenCompra-'+select_val+'-3',
		type: 'post',
		dataType: 'json',
		data: '',
		async:false,
		success: function(){
			}
		});
	
	var asunto = "ANDROID & SMART - Emision de Orden de Compra";
	$('#correoProveedorMSG').text(correoProveedor);
	$('#asuntoMSG').text(asunto);
	$('#ModalExito').modal('show'); 
}

function initTablas(){
	$.ajax({
 		url: 'listOrdenCompra-1',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(listordenCompra){
	 		    $.each(listordenCompra, function(i, item) {	 
	 		    	TableMain.row.add([item.idOrdenCompra,item.fecha,item.observaciones,item.emitente,item.nombreProveedor,item.estadoDescripcion,
	 		    	                  '<button id="OC-'+item.idOrdenCompra+'" type="button" class="btn btn-warning enviarCorreo" ><i class="fa fa-envelope-o fa-sm pr-2" aria-hidden="true"></i>ENVIAR</button>'
 	 				        				]).draw(false);
	 		    });

 			}
 		});

	$.ajax({
 		url: 'listOrdenCompra-3',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(listordenCompra){
	 		    $.each(listordenCompra, function(i, item) {	 
	 		    	TableMain.row.add([item.idOrdenCompra,item.fecha,item.observaciones,item.emitente,item.nombreProveedor,item.estadoDescripcion,
  											'<button type="button" id="OC-'+item.idOrdenCompra+'" class="btn btn-success btnAceptado"  data-toggle="modal" data-target="#confirmacionAceptado">'+
  											'<i class="fa fa-check" aria-hidden="true"></i>ACEPTADO</button>'+
  											'<button type="button" id="OC-'+item.idOrdenCompra+'" class="btn btn-warning btnRechazado"  data-toggle="modal" data-target="#confirmacionRechazado">'+
  											'<i class="fa fa-times" aria-hidden="true"></i>RECHAZADO</button>'
 	 				        				]).draw(false);
	 		    });

 			}
 		});
}
</script>

</body>
</html>