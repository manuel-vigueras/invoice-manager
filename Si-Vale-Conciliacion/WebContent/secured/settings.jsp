<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html>
<html lang="en">

<!-- Head starts here -->
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Justificantes | Si Vale</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--<link href="css/styles.css" rel="stylesheet">-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<style type="text/css">

/* Sticky footer styles
      -------------------------------------------------- */
html, body {
	height: 100%;
	/* The html and body elements cannot have any padding or margin. */
}

/* Wrapper for page content to push down footer */
#wrap {
	min-height: 100%;
	height: auto !important;
	height: 100%;
	/* Negative indent footer by its height */
	margin: 0 auto -60px;
	/* Pad bottom by footer height */
	padding: 0 0 60px;
}

.blue {
	color: #1874CD;
	font-size: 15px;
	font-weight: bold;
}

.green {
	color: #00AA00;
	font-size: 15px;
	font-weight: bold;
}

.red {
	color: #CD3700;
	font-size: 15px;
	font-weight: bold;
}

.head4 {
	font-size: 20px;
	font-weight: bold;
}

.userName {
	font-size: 15px;
}

.table-responsive {
	overflow-x: visible !important;
	overflow-y: visible !important;
}

/* Set the fixed height of the footer here */
#footer {
	height: 60px;
	background-color: #f5f5f5;
}

/* Custom page CSS
      -------------------------------------------------- */
/* Not required for template or sticky footer method. */
#wrap>.container {
	/*padding: 60px 15px 0; */
	padding-top: 60px;
	padding-bottom: 0px;
}

.container .credit {
	margin: 20px 0;
}

.navbar-xs {
	min-height: 28px;
	height: 28px;
}

.navbar-xs .navbar-brand {
	padding: 0px 0px;
	font-size: 16px;
	line-height: 28px;
}

.navbar-xs .navbar-nav>li>a {
	padding-top: 0px;
	padding-bottom: 0px;
	line-height: 28px;
}

#footer>.container {
	padding-left: 15px;
	padding-right: 15px;
}

code {
	font-size: 80%;
}
</style>
</head>


<!-- Body starts here -->
<body>

	<!-- Wrap all page content here -->
	<div id="wrap">

		<jsp:include page="../templates/headerTemplate.jsp" />

		<!-- MAIN CONTAINER 
    =========================================== -->
		<div class="container container-xs">

			<!-- Grid for Panel and Banner -->
			<div class="row">

				<!-- Col for Panel -->
				<div class="col-md-10">

					<jsp:include page="../templates/menuTemplate.jsp" />

					<!-- ROW de botones -->
					<div class="row">
						<div class="col-md-9">
							<h4>Configuraciones</h4>
						</div>
					</div>
					<!-- TERMINA ROW de botones -->




					<br />

					<!-- Grid for Table content -->
					<div class="row">
						<div class="col-md-12">


							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a href="#tabConfGral" role="tab"
									data-toggle="tab">Generales</a></li>
								<li><a href="#tabContables" role="tab" data-toggle="tab">Cuentas
										Contables</a></li>
								<li><a href="#tabCategorias" role="tab" data-toggle="tab">Categorías</a></li>
								<li><a href="#tabCentrosCostos" role="tab"
									data-toggle="tab">Centros de costos</a></li>
							</ul>

							<div class="tab-content">
								<!-- TAB Conf Gral -->
								<div role="tabpanel" class="tab-pane active" id="tabConfGral">
									<br /> <br /> <br /> <br />
									<div class="col-md-3 col-md-offset-3">
										<p>Tope máximo de propinas:</p>
									</div>
									<div class="col-md-3">
										<span class="pull-right">
											<div class="input-group">
												<span class="input-group-addon">%</span> <input
													style="width: 100px;" type="text" class="form-control"
													aria-label="Monto" placeholder="20">
											</div>
										</span>
									</div>
									<br /> <br /> <br /> <br />
									<div class="col-md-3 col-md-offset-3">
										<p>Asignación automática de transacciones a justificantes
											por rango de fechas:</p>
									</div>
									<div class="col-md-3">
										<span class="pull-left">
											<div class="checkbox">
												<label> <input type="checkbox">
												</label>
											</div>
										</span>
									</div>
									<br /> <br /> <br /> <br />
									<div class="col-md-3 col-md-offset-3">
										<p>Dirección de su oficina:</p>
									</div>
									<div class="col-md-6">
										<span class="pull-left"> <textarea class="form-control"
												id="message-text"
												placeholder="Av Insurgentes #4038, México DF"></textarea>
										</span>
									</div>
								</div>
								<!-- TERMINA TAB Conf Gral -->







								<!-- TAB Contables -->
								<div role="tabpanel" class="tab-pane" id="tabContables">
									<!-- Data Table Panel-->
									<div class="panel panel-default">
										<div class="panel-heading">
											<div class="row">
												<div class="col-md-6">
													<h3 class="panel-title">Cuentas Contables</h3>
												</div>

												<div class="col-md-6">
													<div class="btn-group pull-right ">
														<button type="button" class="btn btn-default btn-sm"
															data-toggle="modal" data-target="#modalNuevaCuenta">
															<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														</button>
													</div>
												</div>
												<!-- End of Table Header right -->

											</div>
										</div>

										<div class="panel-body">
											<div class="table-responsive">
												<table class="table table-striped">
													<thead>
														<tr>
															<th style="width: 150px;">Clave</th>
															<th style="width: 150px;">Descripcion</th>
															<th style="width: 150px;" class="text-right">Acción</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>501.01</td>
															<td>Costo de venta</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editCuentaC">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaCuentaC">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td>601.49</td>
															<td>Viáticos y gastos de viaje</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editCuentaC">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaCuentaC">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- End of Data Table Panel-->
								</div>
								<!-- TERMINA TAB Contables -->








								<!-- TAB Categorias -->
								<div role="tabpanel" class="tab-pane" id="tabCategorias">
									<!-- Data Table Panel-->
									<div class="panel panel-default">

										<div class="panel-heading">
											<div class="row">
												<div class="col-md-6">
													<h3 class="panel-title">Categorías</h3>
												</div>

												<div class="col-md-6">

													<div class="btn-group pull-right ">
														<button type="button" class="btn btn-default btn-sm"
															data-toggle="modal" data-target="#modalNuevaSubcat">
															<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														</button>
													</div>
												</div>
												<!-- End of Table Header right -->

											</div>
										</div>

										<div class="panel-body">
											<div class="table-responsive">
												<table class="table table-striped">
													<thead>
														<tr>
															<th style="width: 150px;">Subcategoría</th>
															<th style="width: 150px;">Categoria</th>
															<th style="width: 150px;">Cuenta contable</th>
															<th style="width: 150px;" class="text-right">Acción</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>subcategoría</td>
															<td>Restaurantes</td>
															<td>Viáticos y gastos de viaje</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editSubcat">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="">Cambiar de categoría</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaSubcat">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td>subcategoría</td>
															<td>Hospitales</td>
															<td>Viáticos y gastos de viaje</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editSubcat">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="">Cambiar de categoría</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaSubcat">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td>subcategoría</td>
															<td>Librerías</td>
															<td>Costo de venta</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editSubcat">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="">Cambiar de categoría</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaSubcat">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td>subcategoría</td>
															<td>Zapaterías</td>
															<td>Costo de venta</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editSubcat">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="">Cambiar de categoría</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaSubcat">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- End of Data Table Panel-->
								</div>
								<!-- TERMINA TAB Categorias -->










								<!-- TAB Centros de Costos -->
								<div role="tabpanel" class="tab-pane" id="tabCentrosCostos">
									<!-- Data Table Panel-->
									<div class="panel panel-default">

										<div class="panel-heading">
											<div class="row">
												<div class="col-md-6">
													<h3 class="panel-title">Centros de costos</h3>
												</div>

												<div class="col-md-6">

													<div class="btn-group pull-right ">
														<button type="button" class="btn btn-default btn-sm"
															data-toggle="modal" data-target="#modalNuevoCentroC">
															<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														</button>
													</div>
												</div>
												<!-- End of Table Header right -->

											</div>
										</div>

										<div class="panel-body">
											<div class="table-responsive">
												<table class="table table-striped">
													<thead>
														<tr>
															<th style="width: 150px;">Clave</th>
															<th>Centro de costos</th>
															<th style="width: 150px;" class="text-right">Acción</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>8765</td>
															<td>Embotelladoras del Norte</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editCentroC">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaCentroC">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td>4569</td>
															<td>Mantenimiento de planta automotriz</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editCentroC">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaCentroC">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr>
															<td>8374</td>
															<td>Venta de maquinas empacadoras</td>
															<td>
																<div class="btn-group pull-right ">
																	<button type="button"
																		class="btn btn-default btn-xs dropdown-toggle"
																		data-toggle="dropdown">
																		<span class="glyphicon glyphicon-option-vertical"
																			aria-hidden="true"></span>
																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#editCentroC">Editar</a></li>
																		<li role="presentation"><a role="menuitem"
																			tabindex="-1" href="" data-toggle="modal"
																			data-target="#eliminaCentroC">Eliminar</a></li>
																	</ul>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- End of Data Table Panel-->
								</div>
								<!-- TERMINA TAB Centros de Costos -->
							</div>

						</div>
					</div>
					<!-- End of Grid for Table content -->
				</div>
				<!-- Col for Panel -->
				<!-- Col for Banner -->
				<div class="col-md-2">
					<img src="img/sivale-banner.gif" class="img-responsive"
						alt="Responsive image" aligne="right">
				</div>
				<!-- End of Col for Banner -->
			</div>
			<!-- End of Grid for Panel and Banner -->







			<!-- ==================================================
                    MODAL VIEWS
    ================================================== -->
			<!-- MODAL AGREGAR CUENTA CONTABLE -->
			<div class="modal fade" id="modalNuevaCuenta" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Nueva cuenta
								contable</h4>
						</div>

						<div class="modal-body">

							<!--Formulario -->
							<form>
								<br />
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newClave">Clave</label> <input type="text"
												class="form-control" id="exampleInputEmail1" placeholder="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newCuentaNombre">Nombre</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												placeholder="">
										</div>
									</div>
								</div>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Guardar</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL AGREGAR CUENTA CONTABLE -->



			<!-- MODAL EDITAR CUENTA CONTABLE -->
			<div class="modal fade" id="editCuentaC" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Nueva cuenta
								contable</h4>
						</div>

						<div class="modal-body">

							<!--Formulario -->
							<form>
								<br />
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newClave">Clave</label> <input type="text"
												class="form-control" id="exampleInputEmail1"
												placeholder="501.01">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newCuentaNombre">Nombre</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												placeholder="Costos de venta">
										</div>
									</div>
								</div>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Guardar</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL EDITAR CUENTA CONTABLE -->




			<!-- MODAL AGREGAR CENTRO DE COSTOS -->
			<div class="modal fade" id="modalNuevoCentroC" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Nueva Centro de
								Costos</h4>
						</div>
						<div class="modal-body">
							<!--Formulario -->
							<form>
								<br />
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newClave">Clave</label> <input type="text"
												class="form-control" id="exampleInputEmail1" placeholder="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newCuentaNombre">Nombre</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												placeholder="">
										</div>
									</div>
								</div>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Guardar</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL AGREGAR CENTRO DE COSTOS -->


			<!-- MODAL EDITAR CENTRO DE COSTOS -->
			<div class="modal fade" id="editCentroC" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Editar Centro de
								Costos</h4>
						</div>
						<div class="modal-body">
							<!--Formulario -->
							<form>
								<br />
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newClave">Clave</label> <input type="text"
												class="form-control" id="exampleInputEmail1" value="74512">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-10 col-md-offset-1">
										<div class="form-group">
											<label for="newCuentaNombre">Nombre</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												value="Proyecto #34">
										</div>
									</div>
								</div>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Guardar</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL EDITAR CENTRO DE COSTOS -->




			<!-- MODAL PARA ELIMINAR CUENTA CONTABLE -->
			<div class="modal fade" id="eliminaCuentaC" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Elimina cuenta
								contable</h4>
						</div>
						<div class="modal-body">
							<div class="bs-example">
								<br />
								<p>
									<span class="label label-danger">Atención</span> La cuenta
									contable será eliminada.
								</p>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Aceptar</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- TERMINA MODAL PARA ELIMINAR CUENTA CONTABLE -->



			<!-- MODAL PARA ELIMINAR CENTRO DE COSTOS -->
			<div class="modal fade" id="eliminaCentroC" tabindex="-1"
				role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Elimina centor de
								costos</h4>
						</div>
						<div class="modal-body">
							<div class="bs-example">
								<br />
								<p>
									<span class="label label-danger">Atención</span> El centro de
									costos será eliminado.
								</p>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Aceptar</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- TERMINA MODAL PARA ELIMINAR CENTRO DE COSTOS -->

			<!-- ==================================================
                    TEMRINA MODAL VIEWS
    ================================================== -->

		</div>
		<!-- End of MAIN CONTAINER -->

	</div>
	<!-- Footer
    ================================================== -->
	<div id="footer">
		<div class="container">
			<p class="text-muted credit">
				Si Vale <a href="http://latbc.com">Latbc 2015</a> Todos los derechos
				reservados.
			</p>
		</div>
	</div>
	<!-- End of Footer -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	<!-- script references -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-filestyle.min.js">
		
	</script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.datepicker').datepicker();
		});
	</script>
	<script>
		var d = new Date();
		document.getElementById("date").innerHTML = d.toDateString();

		$('.dropdown-menu input').click(function(e) {
			e.stopPropagation(); //This will prevent the event from bubbling up and close the dropdown when you type/click on text boxes.
		});
	</script>
</body>
</html>