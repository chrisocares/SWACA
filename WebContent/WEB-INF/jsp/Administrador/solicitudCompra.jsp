<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWACA - Menu</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Fira+Sans|Roboto:300,400|Questrial|Satisfy">
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="plugins/mdl/material.min.css" type="text/css">
<link rel="stylesheet" href="plugins/MDB/css/mdb.min.css" type="text/css">
<link rel="stylesheet" href="plugins/select2/css/select2.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="plugins/datepicker/css/datepicker.css" type="text/css">
<link rel="stylesheet" href="css/general.css" type="text/css">
<link rel="stylesheet" href="css/solicitudCompra.css" type="text/css">
<link rel="stylesheet" href="plugins/css/dataTables.bootstrap4.min.css" type="text/css">
<link rel="stylesheet" href="plugins/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
	  <jsp:include page="../Administrador/PageMasterAdministrador.jsp"></jsp:include>
	  <main class="mdl-layout__content">
	    <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
	      <div class="page-content">
	      <!-- Your content goes here -->
	      <div class="demo-card-wide mdl-card mdl-shadow--2dp container">
			  <div class="mdl-card__title">
			    <h1 class="mdl-card__title-text" id="numeroSolicitud"></h1>
			  </div>
			  <div class="mdl-card__supporting-text container">
			   	<div>
			   	  <div>
			   	  	<table class="table table-bordered" style="color:black">
					  <thead>
					    <tr>
					      <th colspan="2">DATOS DEL SOLICITANTE</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="col">Nombre</th>
					      <td>${Usuario.nombre}</td>
					    </tr>
					    <tr>
					      <th scope="col">Numero de Documento</th>
					      <td>${Usuario.numeroDocumento}</td>
					    </tr>
					    <tr>
					      <th scope="col">Tienda</th>
					      <td>${Usuario.idTienda.descripcion}</td>
					    </tr>
					    <tr>
					      <th scope="col">Codigo de Tienda</th>
					      <td>${Usuario.idTienda.idTienda}</td>
					    </tr>
					    <tr>
					      <th scope="row">Ubicación</th>
					      <td>${Usuario.idTienda.departamento} - ${Usuario.idTienda.distrito} - ${Usuario.idTienda.direccion}</td>
					    </tr>
					    <tr>
					      <th scope="row">Telefono</th>
					      <td>${Usuario.idTienda.telefono}</td>
					    </tr>
					  </tbody>
					</table>
			   	  </div>	
				  <div class="mdl-textfield mdl-js-textfield" id="divDescripcion" >
				    <input class="mdl-textfield__input" pattern="[a-zA-Z0-9]+" type="text" id="txtdescripcion">
				    <label class="mdl-textfield__label" for="sample1" >Agregue una descripcion a la solicitud...</label>
				  </div>
				  <form class="form-inline">
				  <div class="md-form form-group">
				        <i class="fa fa-calendar prefix"></i>
				        <input type="text" id="pedido" class="form-control validate datepicker" disabled>
				        <label id="lblpedidoca" for="pedido" data-error="wrong" data-success="Correcto">Fecha del Pedido</label>
				  </div>
				  <div class="md-form form-group">
				        <i class="fa fa-calendar prefix"></i>
				        <input type="text" id="entrega" class="form-control validate datepicker">
				        <label for="entrega" data-error="wrong" data-success=""Correcto"">Fecha de Entrega</label>
				   </div>
				   </form>
				</div>
			  </div>
			  <div class="mdl-card__actions mdl-card--border">
				<button type="button" class="btn btn-secondary" id="btnAddProducto" data-toggle="modal" data-target="#agregarProducto"><i class="glyphicon glyphicon-plus"></i> Agregar Item</button>
			  </div>
			</div>
			<div class="demo-card-wide mdl-card mdl-shadow--2dp container m-t-15">
			  <div class="mdl-card__supporting-text container">
			   	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" id="table-productosList" style="width:100%">
				  <thead>
				    <tr>
				      <th>Codigo</th>
				      <th>Producto</th>
				      <th>Categoria</th>
				      <th>Cantidad</th>
				      <th>Descripcion</th>
				      <th>Fecha Limite</th>
				      <th></th>
				      <th></th>
				    </tr>
				  </thead>
				  <tbody style="color:black;">
				  </tbody>
				</table>
			  </div>
			</div>
			<div class="demo-card-wide mdl-card mdl-shadow--2dp container m-t-15" id="card_button">
				<button type="button" class="btn btn-success" id="enviarSolicitud">Enviar Solicitud</button>
			</div>
		</div>
	    </section>
	    <section class="mdl-layout__tab-panel" id="fixed-tab-2">
	      <div class="page-content">
	      <!-- Your content goes here -->
	      <jsp:include page="../Administrador/Tab2SolicitudCompra.jsp"></jsp:include>
	      </div>
	    </section>
	    <section class="mdl-layout__tab-panel" id="fixed-tab-3">
	      <div class="page-content"><!-- Your content goes here --></div>
	    </section>
	  </main>
	</div>	

	
<div class="modal fade" id="agregarProducto"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header light-blue darken-3 white-text">
                <h4 class="title"><i class="fa fa-plus-circle"></i> Solicitar Producto</h4>
                <button type="button" class="close waves-effect waves-light" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--Body-->
            <div class="modal-body">
                <div class="md-form form-sm">
                    <i class="fa fa-mobile prefix"></i><label>Eliga un producto</label>
                </div>
                <div class="m-t-65">
					<select class="select" id="selectProductos" name="state">
					  <option value="init">Seleccione un Producto ...</option>
					</select>
				</div>
				<form class="form-inline dnone" id="setDatos">
				<div class="md-form form-group">
				        <i class="fa fa-user prefix"></i>
				        <input type="text" id="formProveedor" class="form-control validate" disabled>
				        <label id="lblformProveedor">Proveedor</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-file-o prefix"></i>
				        <input type="text" id="formCategoria" class="form-control validate" disabled>
				        <label id="lblformCategoria">Categoria</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-file-o prefix"></i>
				        <input type="text" id="formModelo" class="form-control validate" disabled>
				        <label id="lblformModelo">Modelo</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-file-o prefix"></i>
				        <input type="text" id="formBanda" class="form-control validate" disabled>
				        <label id="lblformBanda">Banda</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-file-o prefix"></i>
				        <input type="text" id="formColor" class="form-control validate" disabled>
				        <label id="lblformColor">Color</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-file-o prefix"></i>
				        <input type="text" id="formMarca" class="form-control validate" disabled>
				        <label id="lblformMarca">Marca</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-calendar prefix"></i>
				        <input type="text" id="formFechaLimite" class="form-control validate" disabled>
				        <label id="lblformFechaLimite" data-error="wrong" data-success="Correcto">Fecha Registro</label>
				</div>
				<div class="md-form form-group">
				        <i class="fa fa-plus prefix"></i>
				        <label data-error="wrong" data-success="Correcto">Cantidad</label>
				        <input type="number" class="form-control validate" id="formcantidadPedido" min="1" max="100">      
				</div>
				<div class="md-form form-group" style="width:92% !important;">
				        <i class="fa fa-pencil prefix"></i>
				        <input type="text" id="formDescripcion" class="form-control validate">
				        <label for="formDescripcion">Descripcion</label>
				</div>
                </form>
                <div class="text-center mt-2">
                    <button class="btn btn-info" id="addItemList">Añadir <i class="fa fa-sign-in ml-1"></i></button>
                </div>

            </div>
            <!--Footer-->
            <div class="modal-footer">
                <div class="options text-center text-md-right mt-1">
                    <p id="txtmensage">Existen "x" unidades de este producto en stock ,  Su pedido puede demorar en llegar por que no existe stock en el almacen</p>
                </div>
                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- Modal Eliminar Item de Lista -->
    <div class="modal fade" id="deleteItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header">
                    <p class="heading lead">Eliminar de la Lista</p>
    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
    
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                        <p>Estas seguro de eliminar este Item de la Lista ?</p>
                    </div>
                </div>
    
                <!--Footer-->
                <div class="modal-footer justify-content-center">
                    <a type="button" class="btn btn-primary-modal" id="AceptarbtndeleteItemLista">Aceptar <i class="fa fa-trash ml-1"></i></a>
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Cerrar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
    <!-- Central Modal Medium Danger-->
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
                    <p class="heading lead">Solicitud Registrada</p>
    
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
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Aceptar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
    <div class="modal fade" id="detallexsolicitudModal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
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
    <div class="modal fade" id="deleteItemSolicitud" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <a type="button" class="btn btn-primary-modal" id="aceptardeleteItemSolicitud">Aceptar <i class="fa fa-trash ml-1"></i></a>
                    <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Cerrar</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
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
	var btnEliminarSolicitudbPorTienda;
	var idGeneral;
	var globalValue;
	var globalProductoId;
	var arr = [];
	var contador = 0;
	var fecha;
	var fechaMensaje;
	var idSelectTrash;
	var table;
	$(document).ready(function() {
		tableAdministrarMisSolicitudes = $('#TableSolicitudes').DataTable();
	    buildTableSolicitudes();
	    $('[name=TableSolicitudes_length]').addClass('mdb-select');
		$('#addItemList').addClass('dnone');
		$('#numeroSolicitud').css('font-weight','bold');
		$('#txtBienvenido').text("SWACA - Registrar Nueva Solicitud de Compra");
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		fechaMensaje = mm+"/"+dd+"/"+yyyy;
		fecha = mm+"/"+dd+"/"+yyyy;
		$('#pedido').val(fecha);
 		$('#lblpedidoca').addClass('active');
		$('#pedido').addClass('input-set');
    	$.ajax({
     		url: 'getProductos',
     		type: 'post',
     		dataType: 'json',
     		data: '',
     		success: function(productos){
     			initSelectProductos(productos);
     			}
     		});
 		
		$('.dropdown-toggle').dropdown();
		$('.select').select2();
		setNumeroSolicitud();
		});
	$(function(){
		$('.datepicker').datepicker();
			
		});
	$('.datepicker').change(function(){
		$(this).parent().addClass('is-focused');
	});

	function setNumeroSolicitud(){
		
		$.ajax({
			url: 'getNumeroSolicitud',
			type: 'post',
			dataType: 'json',
			data: '',
			success:function(numero){
				$('#numeroSolicitud').text("Solicitud de Compra N° "+numero);
				idGeneral = numero;
			}
		});	
		
	}

	$('#addItemList').click(function(){
		if($('#formcantidadPedido').val().length==0||$('#formDescripcion').val().length==0) {
	          $('#txtmensage').text('COMPLETE LOS CAMPOS');
	          $('#txtmensage').css('color','red');
	          $('#txtmensage').css('font-weight','bold');
	    }else{
		    
		$('#agregarProducto').modal('toggle'); 
		globalProductoId.push($('#formcantidadPedido').val());
		globalProductoId.push($('#formDescripcion').val());
		globalProductoId.push($('#formFechaLimite').val());		
		$('#table-productosList tbody').append("<tr id='tr-"+globalProductoId[0]+"'>"+
				"<td></td>"+
				"<td>"+globalProductoId[0]+"</td>"+
				"<td>"+globalProductoId[1]+"</td>"+
				"<td>"+globalProductoId[2]+"</td>"+
				"<td>"+globalProductoId[3]+"</td>"+
				"<td>"+globalProductoId[4]+"</td>"+
				"<td>"+globalProductoId[5]+"</td>"+
				"<td><button id='delete-"+globalProductoId[0]+"'class='btnDelete mdl-button mdl-js-button mdl-button--icon' data-toggle='modal' data-target='#deleteItem'>"+
				"<i class='glyphicon glyphicon-trash'></i>"+
				"</button>"+
				"</td>"+
				"<td><button id='update-"+globalProductoId[0]+"'class='btnUpdate mdl-button mdl-js-button mdl-button--icon' data-toggle='modal' data-target='#modificarProveedor'>"+
				"<i class='glyphicon glyphicon-list-alt'></i>"+
				"</button>"+
				"</td>"+
			  "</tr>");
		 var arreglo = {row1:globalProductoId[3],row2:globalProductoId[4],row3:idGeneral,row4:globalProductoId[0],row5:fecha};
		 arr.push(arreglo);
		 
		 $('#select2_'+globalProductoId[0]).prop('disabled', !$('#select2_'+globalProductoId[0]).prop('disabled'));
		 $('select').select2();
		 $('select').val('init').trigger('change');
		}
	});
    function initSelectProductos(productos){
        $.each(productos, function(i, producto) {	
        	var data=producto.nombreLista;
        	$('#selectProductos').append('<option id="select2_'+producto.idProducto+'" value="'+producto.idProducto+'">'+data+'</option>');
        });
	}

	function initSetDatosProducto(select_val){
		$.ajax({
	 		url: 'getByidProducto-'+select_val,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(producto){
		 		$('#lblformProveedor').addClass('active');
		 		$('#formProveedor').addClass('input-set');
				$('#formProveedor').val(producto.idProveedor);
		 		$('#lblformCategoria').addClass('active');
		 		$('#formCategoria').addClass('input-set');
				$('#formCategoria').val(producto.idCategoria);
		 		$('#lblformModelo').addClass('active');
		 		$('#formModelo').addClass('input-set');
				$('#formModelo').val(producto.modelo);
		 		$('#lblformBanda').addClass('active');
		 		$('#formBanda').addClass('input-set');
				$('#formBanda').val(producto.banda);
		 		$('#lblformColor').addClass('active');
		 		$('#formColor').addClass('input-set');
				$('#formColor').val(producto.color);
		 		$('#lblformMarca').addClass('active');
		 		$('#formMarca').addClass('input-set');
				$('#formMarca').val(producto.idMarca);
		 		$('#lblformFechaLimite').addClass('active');
				$('#formFechaLimite').addClass('input-set');
				$('#formFechaLimite').val(fecha);
				
				globalProductoId = [globalValue,producto.nombreLista,producto.idCategoria];
	 		}
	 	});

	}
    $('#selectProductos').select2().on("change", function(e) {
	      var select_val = $(e.currentTarget).val();
	      globalValue = select_val;
	      if(select_val=='init'){
	    	  $('#setDatos').addClass('dnone');
	    	  $('#addItemList').addClass('dnone');
	    	  $('#txtmensage').text('');
	      }else{
	    	  $('#setDatos').removeClass('dnone');
	    	  $('#addItemList').removeClass('dnone');
		      initSetDatosProducto(select_val);
	      }
	    });
	$('#enviarSolicitud').click(function(){
		if($('#txtdescripcion').val().length==0||$('#entrega').val().length==0){
			$('#modalMensajeError').text('Complete los campos');
			$('#modalCamposVacios').modal('show'); 
		}else if(arr.length==0||arr===undefined){
			$('#modalMensajeError').text('Debe agregar almenos 1 producto');
			$('#modalCamposVacios').modal('show'); 
		}else{
			var fechaE = $('#entrega').val();
			var descripcion = $('#txtdescripcion').val();
			for(var i=0;i<3;i++){
				fecha = fecha.replace("/","&");
				fechaE = fechaE.replace("/","&");
			}
	    	$.ajax({
	     		url: 'createSolicitud-'+descripcion+'-'+fecha+'-'+fechaE+'-'+'${Usuario.idTienda.idTienda}'+'-'+'${Usuario.idUsuario}',
	     		type: 'post',
	     		dataType: 'json',
	     		data: '',
	     		success: function(productos){
	     			}
	     		});
	 		var item;
			  var tamaño = arr.length;
			  var i;
			  var arreglo = [];
				  for(i=0;i<tamaño;i++){
					    for (item in arr[i]) {
					        var obj = arr[i][item];
					    	arreglo.push(obj);
					    }
					    pushArraytoJSON(arreglo);
					    arreglo.length=0;
					}
			$('#mensajeModalRegistro').text(
					"La solicitud fue registrado Exitosamente ! , el codigo de solicitud de compra es : "+idGeneral +". "+"con fecha de Registro : "+fechaMensaje +" y como fecha Limite de entrega : "+$('#entrega').val()+".");
			$('#RegistradoModal').modal('show'); 
		}
	});
	$('#AceptarbtndeleteItemLista').click(function(){
		$('#tr-'+idSelectTrash).remove();	
		$('#deleteItem').modal('toggle');
		$('#select2_'+idSelectTrash).prop('disabled', !$('#select2_'+idSelectTrash).prop('disabled'));
		$('select').select2();
		for(var a = 0; a < arr.length; a++) {
		    for(var b in arr[a]) {
		        if(arr[a].row4 === idSelectTrash) {
		            arr.splice(a, 1);
		            a--;
		            break;
		        }
		    }
		}
		
	});
	$(document).on('click','.btnDelete',function(e){
		idSelectTrash=this.id.slice(7,this.id.length);
	});

	function pushArraytoJSON(params){
			var cantidad = params[0];
			var descripcion = params[1];
			var nroSolicitud = params[2];
			var idProducto = params[3];
			var fechax = params[4];
			fechax = fechax.replace("/","&");
			fechax = fechax.replace("/","&");
			fechax = fechax.replace("/","&");
	    	$.ajax({
	     		url: 'createDetalle-'+cantidad+'-'+descripcion+"-"+fechax+"-"+idProducto+"-"+nroSolicitud,
	     		type: 'post',
	     		dataType: 'json',
	     		data: '',
	     		success: function(productos){
	     			}
	     	});
	}

	$("#RegistradoModal").on("hide.bs.modal", function () {
		location.reload();
	});

	/*function buildTableSolicitudes(){

    	$.ajax({
     		url: 'getSolicitudes',
     		type: 'post',
     		dataType: 'json',
     		data: '',
     		success: function(detallesSolicitudes){
     			$.each (detallesSolicitudes , function (i ,detalle){
     				
     				table.row.add([detalle.idDetalleSolicitudCompra,detalle.cantidad,detalle.descripcion,
     				              detalle.fechaRegistro,detalle.estado,
     				              '<button id="PDF-"'+detalle.cantidad+'" class="btnDescargarPDF mdl-button mdl-js-button mdl-button--icon">'+
									'<i class="glyphicon glyphicon-download-alt"></i>'+
									'</button>']).draw(false);
     			});
     			}
     		});
 		
		}

	$('.btnDescargarPDF').click(function() {

	});*/

//SOLICITUD-----------------------------------------------------------------------------------------------------------------
function buildTableSolicitudes(){
	$.ajax({
 		url: 'getSolicitudesComprabyTienda-'+'${Usuario.idTienda.idTienda}'+'-1',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(solicitudesCompra){
 			$.each (solicitudesCompra , function (i ,solicitudCompra){
 				
 				tableAdministrarMisSolicitudes.row.add([solicitudCompra.idSolicitudCompra,solicitudCompra.descripcion,
 				              solicitudCompra.fechaRegistro,solicitudCompra.descripcionEstado,
 				              '<button  id="verSolicitud-'+solicitudCompra.idSolicitudCompra+'" data-toggle="modal" data-target="#detallexsolicitudModal" class="btnVerSolicitudbPorTienda mdl-button mdl-js-button mdl-button--icon">'+
								'<i class="fa fa-list-ul" aria-hidden="true"></i>'+
									'</button>'+
							  '<button  id="eliminarSolicitud-'+solicitudCompra.idSolicitudCompra+'" data-toggle="modal" data-target="#deleteItemSolicitud" class="btnEliminarSolicitudbPorTienda mdl-button mdl-js-button mdl-button--icon">'+
								'<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>'+
									'</button>']).draw(false);
 				});
 			}
 		});
		
	}
$(document).on('click','.btnVerSolicitudbPorTienda',function(e){
	idSolicitudSeleccionadobtnVer=this.id.slice(13,this.id.length);
	$('#muestraDetallesSolicitud tbody').empty();
	initSelectDetallebySolicitud(idSolicitudSeleccionadobtnVer);
	$('#titleVerSolicitud').text("Detalles de la Solicitud : #"+idSolicitudSeleccionadobtnVer);
	
});
//DETALLES DE LA SOLICITUD -------------------------------------------------------------------------------------------------
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
	 					'<tr id="trmuestraDetalle-'+detallesolicitud.idDetalleSolicitudCompra+'"><td style="text-align:left"">'+detallesolicitud.nombreProducto+'</td>'+
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
//MODAL -------------------------------------------------------------------------------------------------------------------
$(document).on('click','.btnmodifyDetalleSolicitud',function(e){
		idModificarCantidad=this.id.slice(23,this.id.length);
		document.getElementById(this.id).style.display = 'none';
		document.getElementById("saveCantidadDetalleSolicitud-"+idModificarCantidad).style.display = 'block';
		$("#inputCantidad-"+idModificarCantidad).attr("readonly", false);
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
	updateCantidad(can);
});
function updateCantidad(cantidad){
	$.ajax({
 		url: 'updateCantidadDetalle-'+idModificarCantidad+'-'+cantidad,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(){
 			}
 		});
}
$(document).on('click','.btnEliminarSolicitudbPorTienda',function(e){
	idRemover=this.id.slice(18,this.id.length);
});
$('#aceptardeleteItemSolicitud').click(function() {
	$.ajax({
 		url: 'updateEstadoSolicitud-'+idRemover+'-3',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		async: false,
 		success: function(){
 			}
 		});
	$('#deleteItemSolicitud').modal('toggle');
	tableAdministrarMisSolicitudes.clear().draw();
	buildTableSolicitudes();
	
});
//----------------------------------------------------------------------------------------------------------------------------
</script>
</body>
</html>