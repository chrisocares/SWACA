<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SWACA - Menu</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Fira+Sans|Roboto:300,400|Questrial|Satisfy">
<link rel="stylesheet" type="text/css" href="plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="plugins/mdl/material.min.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/general.css" type="text/css">
<link rel="stylesheet" href="css/gestionarProveedor.css" type="text/css">
</head>
<body>
	<!-- Always shows a header, even in smaller screens. -->
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  <header class="mdl-layout__header">
	    <div class="mdl-layout__header-row">
	      <!-- Title -->
	      <span class="mdl-layout-title">ANDROID & SMART</span>
	      <!-- Add spacer, to align navigation to the right -->
	      <div class="mdl-layout-spacer"></div>
	      <!-- Navigation. We hide it in small screens. -->
	      <nav class="mdl-navigation mdl-layout--large-screen-only">
	        <a class="mdl-navigation__link" href="">Gestionar Proveedores</a>
	        <a class="mdl-navigation__link" href="">Link</a>
	        <a class="mdl-navigation__link" href="">Link</a>
	        <a class="mdl-navigation__link" href="">Link</a>
	      </nav>
	    </div>
	  </header>
	  <div class="mdl-layout__drawer">
	    <span class="mdl-layout-title">Menu</span>
	    <nav class="mdl-navigation">
	      <a class="mdl-navigation__link" href="">Gestionar Proveedores</a>
	      <a class="mdl-navigation__link" href="">Link</a>
	      <a class="mdl-navigation__link" href="">Link</a>
	      <a class="mdl-navigation__link" href="">Link</a>
	    </nav>
	  </div>
	  <main class="container">
	    <div class="page-content">
	    <!-- Tabla Proveedores -->
		<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading"></div>
		  <div class="panel-body">
		    <h4>Proveedores</h4>
			<!-- Colored raised button -->
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" data-toggle="modal" data-target="#registrarProveedor">
				<i class="glyphicon glyphicon-plus"></i>
			  Nuevo Proveedor
			</button>
		  </div>
		</div>
		  <!-- Table -->
	    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" id="table-proveedores">
		  <thead>
		    <tr>
		      <th>Nombre Comercial</th>
		      <th>Razón Social</th>
		      <th>Tratamiento</th>
		      <th>R.U.C</th>
		      <th>Telefono Contacto</th>
		      <th>E-mail</th>
		      <th>Dirección</th>
		      <th></th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
		  </tbody>
		</table>
		
	    

	    </div>
	  </main>
	</div>
	<div class="modal fade" id="registrarProveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	    <form:form action="createProveedor" commandName="proveedor" method="POST">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Registrar Proveedor</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	          <div class="form-group">
	          	<div class="input-group">
	          	</div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt1" name="nombreComercial">
				    <label class="mdl-textfield__label" for="txt1">Nombre Comercial</label>
				  </div> 
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt2" name="razonSocial">
				    <label class="mdl-textfield__label" for="txt2">Razón Social</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt3" name="tratamiento">
				    <label class="mdl-textfield__label" for="txt3">Tratamiento</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" pattern="-?[0-9]*(\.[0-9]+)?" type="text" id="txt4" name="ruc">
				    <label class="mdl-textfield__label" for="txt4">RUC</label>
				    <span class="mdl-textfield__error">Solo Numeros</span>
				  </div>
				  <div class="solo-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt5" name="nombreContacto">
				    <label class="mdl-textfield__label" for="txt5">Nombre Contacto</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" pattern="-?[0-9]*(\.[0-9]+)?" type="text" id="txt4" name="telefonoContacto">
				    <label class="mdl-textfield__label" for="txt6">Telefono</label>
				    <span class="mdl-textfield__error">Solo Numeros</span>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt7" name="email">
				    <label class="mdl-textfield__label" for="txt7">E-mail</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt8" name="direccion">
				    <label class="mdl-textfield__label" for="txt8">Dirección</label>
				  </div>
				  <div class="col-sm-6 group-input2 mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt9" name="pais">
				    <label class="mdl-textfield__label" for="txt9">País</label>
				  </div>
				  <div class="col-sm-6 group-input2 mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input class="mdl-textfield__input" type="text" id="txt9" name="departamento">
				    <label class="mdl-textfield__label" for="txt9">Departamento</label>
				  </div>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	        <button type="submit" class="btn btn-primary" ><i class="glyphicon glyphicon-floppy-disk"></i>  Guardar</button>
	      </div>
	      </form:form>
	    </div>
	  </div>
	</div>
	
	<!-- Modal 	Delete Proveedor-->
	<div class="modal fade" id="deleteProveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Eliminar Proveedor</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        Estas seguro de eliminar este proveedor ? 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal" id="btndeleteProveedor">Aceptar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal Update Proveedor -->
	<div class="modal fade" id="modificarProveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	    <form:form action="updateProveedor" commandName="proveedor" method="POST">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modificar datos del Proveedor</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	          <div class="form-group">
	          	<div class="input-group">
	          	<input name="idProveedor" id="idProveedorUpdate" style="display:none">
	          	</div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label" id="xs">
				    <input  disabled class="mdl-textfield__input" type="text" id="txt1Update" name="nombreComercial">
				    <label class="mdl-textfield__label" for="txt1Update">Nombre Comercial</label>
				  </div> 
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt2Update" name="razonSocial">
				    <label class="mdl-textfield__label" for="txt2Update">Razón Social</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt3Update" name="tratamiento">
				    <label class="mdl-textfield__label" for="txt3Update">Tratamiento</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" pattern="-?[0-9]*(\.[0-9]+)?" type="text" id="txt4Update" name="ruc">
				    <label class="mdl-textfield__label" for="txt4Update">RUC</label>
				    <span class="mdl-textfield__error">Solo Numeros</span>
				  </div>
				  <div class="solo-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt5Update" name="nombreContacto">
				    <label class="mdl-textfield__label" for="txt5Update">Nombre Contacto</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" pattern="-?[0-9]*(\.[0-9]+)?" type="text" id="txt6Update" name="telefonoContacto">
				    <label class="mdl-textfield__label" for="txt6Update">Telefono</label>
				    <span class="mdl-textfield__error">Solo Numeros</span>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt7Update" name="email">
				    <label class="mdl-textfield__label" for="txt7Update">E-mail</label>
				  </div>
				  <div class="col-sm-6 group-input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt8Update" name="direccion">
				    <label class="mdl-textfield__label" for="txt8Update">Dirección</label>
				  </div>
				  <div class="col-sm-6 group-input2 mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt9Update" name="pais">
				    <label class="mdl-textfield__label" for="txt9Update">País</label>
				  </div>
				  <div class="col-sm-6 group-input2 mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				    <input disabled class="mdl-textfield__input" type="text" id="txt10Update" name="departamento">
				    <label class="mdl-textfield__label" for="txt10Update">Departamento</label>
				  </div>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	        <button type="button" class="btn btn-warning" id="edit">Editar</button>
	        <button type="submit" class="btn btn-primary" ><i class="glyphicon glyphicon-floppy-disk"></i>  Guardar</button>
	      </div>
	      </form:form>
	    </div>
	  </div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="plugins/jquery/jquery-3.2.1.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/mdl/material.min.js"></script>
<script>
	var variable;
	$(document).ready(function(){
		$.ajax({
			url: 'getListProveedor',
			type: 'post',
			dataType: 'json',
			data: '',
			success:function(proveedores){
				initTableProveedores(proveedores);
			}
		});	
		
	});

	function initTableProveedores(proveedores){
		$.each (proveedores , function (i ,proveedor){
			$('#table-proveedores tbody').append("<tr>"+
													"<td></td>"+
													"<td>"+proveedor.nombreComercial+"</td>"+
													"<td>"+proveedor.razonSocial+"</td>"+
													"<td>"+proveedor.tratamiento+"</td>"+
													"<td>"+proveedor.ruc+"</td>"+
													"<td>"+proveedor.telefonoContacto+"</td>"+
													"<td>"+proveedor.email+"</td>"+
													"<td>"+proveedor.direccion+"</td>"+
													"<td><button id='delete-"+proveedor.idProveedor+"'class='btnDelete mdl-button mdl-js-button mdl-button--icon' data-toggle='modal' data-target='#deleteProveedor'>"+
													"<i class='glyphicon glyphicon-trash'></i>"+
													"</button>"+
													"</td>"+
													"<td><button id='update-"+proveedor.idProveedor+"'class='btnUpdate mdl-button mdl-js-button mdl-button--icon' data-toggle='modal' data-target='#modificarProveedor'>"+
													"<i class='glyphicon glyphicon-list-alt'></i>"+
													"</button>"+
													"</td>"+
												 +"</tr>");
		});
	}

	
	$('#btndeleteProveedor').click(function(){
		var id = variable.slice(7,variable.length);
		$.ajax({
			url: 'updateEstado-'+id,
			type: 'post',
			dataType: 'json',
			data: '',
			success:function(){
				
			}
		});
	});

    $(document).on('click','.btnDelete',function(e){
    	variable=this.id;
    });

    $(document).on('click','.btnUpdate',function(e){
    	var id = this.id.slice(7,this.id.length);
    	$('#idProveedorUpdate').val(id);
		$.ajax({
			url: 'getByidProveedor-'+id,
			type: 'post',
			dataType: 'json',
			data: '',
			success:function(proveedor){
				
				$('#txt1Update')[0].parentElement.MaterialTextfield.change(proveedor.nombreComercial);
				$('#txt2Update')[0].parentElement.MaterialTextfield.change(proveedor.razonSocial);
				$('#txt3Update')[0].parentElement.MaterialTextfield.change(proveedor.tratamiento);
				$('#txt4Update')[0].parentElement.MaterialTextfield.change(proveedor.ruc);
				$('#txt5Update')[0].parentElement.MaterialTextfield.change(proveedor.nombreContacto);
				$('#txt6Update')[0].parentElement.MaterialTextfield.change(proveedor.telefono);
				$('#txt7Update')[0].parentElement.MaterialTextfield.change(proveedor.email);
				$('#txt8Update')[0].parentElement.MaterialTextfield.change(proveedor.direccion);
				$('#txt9Update')[0].parentElement.MaterialTextfield.change(proveedor.pais);
				$('#txt10Update')[0].parentElement.MaterialTextfield.change(proveedor.departamento);
				
			}
		});	
    	
    });
	$('#edit').click(function(){
		$('#txt1Update').attr('disabled',false);
		$('#txt2Update').attr('disabled',false);
		$('#txt3Update').attr('disabled',false);
		$('#txt4Update').attr('disabled',false);
		$('#txt5Update').attr('disabled',false);
		$('#txt6Update').attr('disabled',false);
		$('#txt7Update').attr('disabled',false);
		$('#txt8Update').attr('disabled',false);
		$('#txt9Update').attr('disabled',false);
		$('#txt10Update').attr('disabled',false);
		
	});

</script>
</body>
</html>