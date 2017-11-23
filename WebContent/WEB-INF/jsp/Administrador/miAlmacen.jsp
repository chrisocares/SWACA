<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWACA - Almacén</title>
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
				<div class="container" id="administrarSolicitudesContainer">
		    		<div style="background-color: #E3F0EB; padding: 20px 0px 20px 0px;">
			    		<div class="p-20" style="padding-left: 50px;">
			    			<h2 class="display-3" style="font-weight: bold;">Ver Mi Almacen - VMA</h2>
			    			<p>Podra consultar o gestionar los productos de la manera mas rapida y eficiente</p>
			    		</div>
			    	</div>

		    		<div id="actionOrdenCompra" class="container" style="padding-bottom: 20px; padding-top: 10px;">
	    				<div class="row">
	    					<div class="col-md-7">
	    						<div class="btn-group m-t-15" role="group" aria-label="Basic example">
	    							<ul class="nav nav-pills" style="display: inline-block;">
									  <li class="active">
									      <a class="btn btn-outline-mdb-color waves-effect" data-toggle="pill" role="button" data-target=".menu1tab"><i class="fa fa-mobile fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>STOCK ACTUAL</a>
									  </li>
									  <li>
									      <a class="btn btn-outline-mdb-color waves-effect" data-toggle="pill" role="button" data-target=".menu2tab"><i class="fa fa-road fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>EN CAMINO</a>
									  </li>
									</ul>
								</div>
	    					</div>
	    					<div class="col-md-5" style="padding-left: 53px;">
	    						<div class="btn-group m-t-15" role="group" aria-label="Basic example">
	    							<button type="button" class="btn btn-outline-mdb-color waves-effect" data-toggle="modal" data-target="#aModal"><i class="fa fa-plus fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>agregar</button>
									<button type="button" class="btn btn-outline-mdb-color waves-effect" data-toggle="modal" data-target="#cModal"><i class="fa fa-exchange fa-sm pr-2 btnGroupAction" aria-hidden="true"></i>migrar</button>
								</div>
	    					</div>
	    				</div>
	    			</div>

					<!-- Section-->
					<div class="tab-content">
					  	<div id="div-1" class="tab-pane fade in menu1tab active" class="container-fluid" style="padding-bottom: 60px;">
							<table id="TableProductoEnCamino" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
						        <thead>
						        	<tr style="background-color: #7EEEC1;">
							            <th>Producto</th>
							            <th>Categoria</th>
							            <th>Proveedor</th>
							            <th>Fecha Registro</th>
							            <th>Cantidad</th>
							            <th>Estado</th>
							        </tr>
						        </thead>
						        <tbody>
						        </tbody>
							</table>
						</div>
						<div id="div-2" class="tab-pane fade in menu2tab" class="container-fluid" style="padding-bottom: 60px;">
							<table id="TableProductoStockActual" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
						        <thead>
						        	<tr style="background-color: #7EEEC1;">
							            <th>Producto</th>
							            <th>Categoria</th>
							            <th>Proveedor</th>
							            <th>Fecha Registro</th>
							            <th>Cantidad</th>
							            <th>Estado</th>
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

	<!-- Modal #01-->
	<div class="modal fade" id="aModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header" style="background-color: #bfcfe8">
	            	<div class="container-fluid">
	            		<div class="row">
	            			<div class="col-lg-10">
	            				<h6 class="modal-title">Agregar producto</h6>
	            			</div>
	            			<div class="col-lg-2">
	            				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						            <span aria-hidden="true">&times;</span>
						        </button>
	            			</div>
	            		</div>
	            	</div>
		        </div>
		        <form action="#" method="POST">
		            <div class="modal-body" style="padding-top: 20px;">
	                	<div class="container-fluid" >
	                		<div class="row">
	                			<div class="col-lg-6">
	                				<div class="group">      
								      <input type="text" required placeholder="Banda" style="margin-bottom: 15px;">
								      <input type="text" required placeholder="Fecha Modificado" style="margin-bottom: 15px;">
								      <input type="text" required placeholder="Modelo" style="margin-bottom: 15px;">
								      <input type="text" required placeholder="Tipo" style="margin-bottom: 15px;">
							<!--***--><input type="text" required placeholder="Estado del Producto" style="margin-bottom: 15px;">
							<!--***--><input type="text" required placeholder="Marca" style="margin-bottom: 10px;">
								    </div>
	                			</div>
	                			<div class="col-lg-6">
	                				<div class="group">      
								      <input type="text" required placeholder="Color" style="margin-bottom: 15px;">
								      <input type="text" required placeholder="Fecha de Registro" style="margin-bottom: 15px;">
								      <input type="text" required placeholder="Precio de Venta" style="margin-bottom: 15px;">
								      <input type="text" required placeholder="Valor" style="margin-bottom: 15px;">
							<!--***--><input type="text" required placeholder="Categoria" style="margin-bottom: 15px;">
							<!--***--><input type="text" required placeholder="Proveedor" style="margin-bottom: 10px;">
								    </div>
	                			</div>
	                			<!--PUSE ASTERISCO PORQUE ES MEJOR CAMBIARLOS EN UN SELECT-->
	                		</div>
	                	</div>
		            </div>
		            <div class="modal-footer">
		            	<div class="container-fluid">
		            		<div class="row">
		            			<div class="col-lg-4">&nbsp;</div>
		            			<div class="col-lg-8">
		            				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		            				<button style="margin-bottom: 5px;" type="button" class="btn btn-primary"><span class="fa fa-check fa-sm" aria-hidden="true"></span>&nbsp;&nbsp;Guardar cambios</button>
		            			</div>
		            		</div>
		            	</div>
		            </div>
	            </form>
	        </div>
	    </div>
	</div>

	<!-- Modal #02-->
	<div class="modal fade" id="cModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header" style="background-color: #bfcfe8">
	            	<div class="container-fluid">
	            		<div class="row">
	            			<div class="col-lg-10">
	            				<h6 class="modal-title">Migrar producto a otra tienda (BETA)</h6>
	            			</div>
	            			<div class="col-lg-2">
	            				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						            <span aria-hidden="true">&times;</span>
						        </button>
	            			</div>
	            		</div>
	            	</div>
		        </div>
		        <form action="#" method="POST">
		            <div class="modal-body">
		                <div class="container-fluid" >
	                		<div class="row">
	                			<div class="col-lg-6">
	                				<div class="group"> 
	                					<label>Código del Producto</label> 
										<select class="js-example-basic-single" name="state">
										  <option value="AL">Alabama</option>
										  <option value="WY">Wyoming</option>
										</select>
										<Hr>	
										<label>Código de la Tienda</label> 
										<select class="js-example-basic-single" name="state">
										  <option value="AL">Alabama</option>
										  <option value="WY">Wyoming</option>
										</select>
										<Hr>
										<label style="margin-bottom: 22px;">Fecha Actual</label> 

								    </div>
	                			</div>
	                			<div class="col-lg-6" style="text-align: center; padding-top: 17px;">
	                				<button style="margin-bottom: 8px;" type="button" class="btn btn-default"><span class="fa fa-file-text-o fa-sm" aria-hidden="true"></span>&nbsp;&nbsp;Ver Historial</button>
	                				<button style="margin-bottom: 5px;" type="button" class="btn btn-primary"><span class="fa fa-check fa-sm" aria-hidden="true"></span>&nbsp;&nbsp;Guardar cambios</button>
	                			</div>
	                		</div>
	                	</div>
		            </div>
	            </form>
	        </div>
	    </div>
	</div>

		<!-- Modal #03-->
	<div class="modal fade" id="dModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header" style="background-color: #bfcfe8">
	            	<div class="container-fluid">
	            		<div class="row">
	            			<div class="col-lg-10">
	            				<h6 class="modal-title">Actualizar</h6>
	            			</div>
	            			<div class="col-lg-2">
	            				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						            <span aria-hidden="true">&times;</span>
						        </button>
	            			</div>
	            		</div>
	            	</div>
		        </div>
		        <form action="#" method="POST">
		            <div class="modal-body" style="padding-top: 20px;">
	                	<div class="container-fluid" >
	                		<div class="row">
	                			<div class="col-lg-6">
	                				<div class="group">      
								      <input type="text" class="form-control" required placeholder="Nombre de producto" style="margin-bottom: 15px;" disabled>
								    </div>
	                			</div>
	                			<div class="col-lg-6">
	                				<div class="group">      
								      <input type="text" required placeholder="Cantidad" style="margin-bottom: 15px;">
								    </div>
	                			</div>
	                			<!--PUSE ASTERISCO PORQUE ES MEJOR CAMBIARLOS EN UN SELECT-->
	                		</div>
	                	</div>
		            </div>
		            <div class="modal-footer">
		            	<div class="container-fluid">
		            		<div class="row">
		            			<div class="col-lg-4">&nbsp;</div>
		            			<div class="col-lg-8">
		            				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
		            				<button style="margin-bottom: 5px;" type="button" class="btn btn-primary"><span class="fa fa-check fa-sm" aria-hidden="true"></span>&nbsp;&nbsp;Guardar cambios</button>
		            			</div>
		            		</div>
		            	</div>
		            </div>
	            </form>
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
<script src="plugins/selectQuery/js/bootstrap-select.min.js"></script>

<script>
$('#txtBienvenido').text("Administrar Productos");
$('.select').select2();
$(document).ready(function() {
    $('.js-example-basic-single').select2();
    tablePendiente = $('#TableProductoEnCamino').DataTable();
    tableStock = $('#TableProductoStockActual').DataTable();
    var estado1 = "STOCK";
    var estado2 = "PENDIENTE";
    initTableS(estado2);
    initTableP(estado1);
});

function initTableP(estado){
	$.ajax({
 		url: 'getList-'+estado,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		async:false,
 		success: function(almacen){
 			$.each (almacen , function (i ,item){
		var categoria ; 
		var nombreProducto;
		var proveedor;
 				$.ajax({
 			 		url: 'getByIdDetalleSolicitud-'+item.idDetalle,
 			 		type: 'post',
 			 		dataType: 'json',
 			 		data: '',
 			 		async:false,
 			 		success: function(dato){
 			 			nombreProducto = dato.nombreProducto;
 			 			proveedor = dato.nombreProveedor;
 			 			categoria = dato.descripcionCategoria;
 			 		}
 			 	});
 				
 				tablePendiente.row.add([nombreProducto,categoria,proveedor,'',item.cantidadRegistrada,item.estado,]).draw(false);
 				});
 			}
 		});
}

function initTableS(estado){
	$.ajax({
 		url: 'getList-'+estado,
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		async:false,
 		success: function(almacen){
 			$.each (almacen , function (i ,item){
		var categoria ; 
		var nombreProducto;
		var proveedor;
 				$.ajax({
 			 		url: 'getByIdDetalleSolicitud-'+item.idDetalle,
 			 		type: 'post',
 			 		dataType: 'json',
 			 		data: '',
 			 		async:false,
 			 		success: function(dato){
 			 			nombreProducto = dato.nombreProducto;
 			 			proveedor = dato.nombreProveedor;
 			 			categoria = dato.descripcionCategoria;
 			 		}
 			 	});
 				
 				tableStock.row.add([nombreProducto,categoria,proveedor,'',item.cantidadRegistrada,item.estado,]).draw(false);
 				});
 			}
 		});
}


</script>

</body>
</html>