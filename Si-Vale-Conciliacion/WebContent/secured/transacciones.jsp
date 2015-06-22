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
<title>Movimientos | Si Vale</title>
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

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: #f5f5f5;
	background-color: #f5f5f5;
	cursor: inherit;
	display: block;
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

body .modal-sm {
	/* new custom width */
	width: 30%;
	/* must be half of the width, minus scrollbar on the left (30px) */
	/* margin-left:-375px; */
	margin-left: 35%;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>

</head>


<!-- Body starts here -->
<body data-ng-app="myApp">


	<!-- Wrap all page content here -->
	<div id="wrap" data-ng-controller="transaccionesController">

		<jsp:include page="../templates/headerTemplate.jsp" />
		<!-- MAIN CONTAINER 
    =========================================== -->
		<div class="container container-xs">

			<!-- Grid for Panel and Banner -->
			<div class="row">

				<!-- Col for Panel -->
				<div class="col-md-10">

					<jsp:include page="../templates/menuTemplate.jsp" />

					<div class="row">
						<div class="col-md-3">
							<h4>Movimientos de usuarios</h4>
						</div>
						<div class="col-md-3 col-md-offset-6">
							<span class="pull-right">
								<ul class="nav nav-pills">
									<li><a href="<s:url action="facturasAction"/>">Ver
											Facturas</a></li>
							</span>
						</div>
					</div>

					<div class="row">

						<div class="col-md-2" data-ng-controller="getUsuarios">
							<br />
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenuPeriodo" data-toggle="dropdown"
								aria-expanded="true">
								Filtro Usuarios <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-ng-click="getTransacciones()">Promedios Globales
										(todos los usuarios)</a></li>
								<li role="presentation" data-ng-repeat="usr in usuarios"><a
									role="menuitem" tabindex="-1"
									data-ng-click="filterTransaccionesByUser(usr.nombre)">{{usr.idUser}}
										- {{usr.nombre}}</a></li>
							</ul>
						</div>

						<div class="col-md-2" data-ng-controller="getJustificantes">
							<br />
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenuPeriodo" data-toggle="dropdown"
								aria-expanded="true">
								Filtro Justificantes <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-ng-click="getTransacciones()">Todos</a></li>
								<li role="presentation" data-ng-repeat="just in justificantes"><a
									role="menuitem" tabindex="-1"
									data-ng-click="filterTransaccionesByJustificante(just)">{{just}}</a></li>
							</ul>
						</div>
					</div>



					<br />

					<!-- Grid for Table content -->
					<div class="row" data-ng-controller="getTransacciones">
						<div class="col-md-12">

							<!-- Data Table Panel-->
							<div class="panel panel-default">
								<div class="panel-heading">

									<div class="row">
										<div class="col-md-6">
											<h3 class="panel-title">Detalle transacciones</h3>
										</div>

										<!-- Table Header right -->
										<div class="col-md-6 align-right">
											<span class="pull-right"> Periodo:
												<button class="btn btn-default dropdown-toggle"
													type="button" id="dropdownMenuPeriodo"
													data-toggle="dropdown" aria-expanded="true">
													Actual<span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu"
													aria-labelledby="dropdownMenu1">
													<li role="presentation"><a role="menuitem"
														tabindex="-1"
														data-ng-click="filterTransaccionesByPeriodo('mesAnterior')">Mes
															anterior</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1"
														data-ng-click="filterTransaccionesByPeriodo('dosAnterior')">Dos
															meses atras</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1"
														data-ng-click="filterTransaccionesByPeriodo('tresAnterior')">Tres
															meses atras</a></li>
												</ul>
											</span>
										</div>
										<!-- End of Table Header right -->
									</div>

								</div>

								<div class="panel-body">

									<div class="table-responsive">
										<table class="table table-striped">
											<tr>
												<th style="width: 100px;">Usuario</th>
												<th style="width: 100px;">Tarjeta</th>
												<th style="width: 60px;">Id</th>
												<th style="width: 80px;">Fecha</th>
												<th>Concepto</th>
												<th class="text-center" style="width: 100px;">Monto</th>
												<th class="text-center" style="width: 100px;">Saldo</th>
												<th style="width: 80px;">Justificante</th>
												<th style="width: 40px;">Factura</th>
												<th style="width: 60px;">Estatus</th>
											</tr>
											<tr data-ng-repeat="trans in transacciones">
												<td>{{trans.usuario}}</td>
												<td>{{trans.tarjeta}}</td>
												<td>{{trans.id}}</td>
												<td>{{trans.fecha}}</td>
												<td>{{trans.concepto}}</td>
												<td><p class="text-right">{{trans.monto}}</p></td>
												<td><p class="text-right">{{trans.saldo}}</p></td>
												<td><p class="text-left">{{trans.justificante}}</p></td>
												<td><a data-toggle="modal"
													data-target="#modalDetalleFactura1"> <img
														src="img/xml.png" alt="XML"
														style="width: 20px; height: 20px">
												</a></td>
												<td><span class="label label-success">{{trans.estatus}}</span></td>
										</table>
									</div>
								</div>
							</div>
							<!-- End of Data Table Panel-->
						</div>
					</div>
					<!-- End of Grid for Table content -->
				</div>
				<!-- Col for Panel -->
				<!-- Col for Banner -->
				<div class="col-md-2">
					<img src="img/sivale-banner.gif" class="img-responsive"
						alt="Responsive image" align="right">
				</div>
				<!-- End of Col for Banner -->
			</div>
			<!-- End of Grid for Panel and Banner -->

			<!-- MODAL AGREGA COMPROBANTE SUGERIDO #1 -->
			<div class="modal fade" id="modalComprobanteSugerido" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a href="#tabFacturasSugeridas"
									role="tab" data-toggle="tab">Facturas</a></li>
								<li><a href="#tabTicketsSugeridas" role="tab"
									data-toggle="tab">Ticket</a></li>
							</ul>

							<div class="tab-content">
								<!-- TAB Facturas -->
								<div role="tabpanel" class="tab-pane active"
									id="tabFacturasSugeridas">
									<!--Facturas sugeridas -->
									<table class="table table-striped">
										<thead>
											<tr>
												<th style="width: 80px;">Folio</th>
												<th style="width: 100px;">Fecha</th>
												<th>RFC Emisor</th>
												<th style="width: 80px;" class="text-center">Monto</th>
												<th style="width: 150px;" class="text-center">Propina</th>
												<th style="width: 80px;" class="text-center">Total</th>
												<th style="width: 40px;">Asociar</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>987534</td>
												<td>11/04/2015</td>
												<td>SORIANA SA CV <span class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S01">345.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S01"
															oninput="propinaFunction(monto_S01, propina_S01, total_S01, alertaPropinaFacSug)">
													</div>
												</td>
												<td><p class="text-right" id="total_S01">345.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>76534</td>
												<td>19/04/2015</td>
												<td>RESTAURANTE EL CAPITAN SA CV</td>
												<td><p class="text-right" id="monto_S02">750.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S02"
															oninput="propinaFunction(monto_S02, propina_S02, total_S02, alertaPropinaFacSug)">
													</div>
												</td>
												<td><p class="text-right" id="total_S02">750.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>654373</td>
												<td>20/04/2015</td>
												<td>HOTEL DE MEXICO SA CV</td>
												<td><p class="text-right" id="monto_S03">1250.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S03"
															oninput="propinaFunction(monto_S03, propina_S03, total_S03, alertaPropinaFacSug)">
													</div>
												</td>
												<td><p class="text-right" id="total_S03">1250.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura" />
													</div>
												</td>
											</tr>
											<tr>
												<td>Comentarios:</td>
												<td colspan="6">
													<div class="form-group">
														<label class="sr-only" for="comment">Comentario:</label> <input
															type="text" class="form-control" id="facturaComment1"
															placeholder="Ingresa Comentarios" />
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="text-center" id="alertaPropinaFacSug"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning"
											id="vincularButtonIdFac" href="#">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Facturas -->


								<!-- TAB Tickets SUGERIDAS-->
								<div role="tabpanel" class="tab-pane" id="tabTicketsSugeridas">
									<table class="table">
										<thead>
											<tr>
												<td colspan="6"><h5>Ingresa datos de ticket</h5></td>
											</tr>
										</thead>
										<tbody>
											<tr style="height: 75px;">
												<td style="width: 100px;">Fecha:</td>
												<td style="width: 200px;">
													<div class="form-group">
														<div class="input-group date" id="datetimepicker1">
															<input type="text" class="form-control"
																data-provide="datepicker"> <span
																class="input-group-addon"> <span
																class="glyphicon glyphicon-calendar"></span>
															</span>
														</div>
													</div>
												</td>
												<td style="width: 100px;">Ticket:</td>
												<td style="width: 200px;"><span
													class="btn btn-default btn-file"> <span
														class="glyphicon glyphicon-folder-open" aria-hidden="true">
															Explorar <input type="file">
													</span>
												</span></td>
											</tr>
											<tr style="height: 75px;">
												<td>Monto:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="monto_ticket_sug"
															oninput="propinaTicket(monto_ticket_sug, propina_ticket_sug, total_ticket_sug, alertaPropinaTicketSug)">
													</div>
												</td>
												<td>Propina:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_ticket_sug"
															oninput="propinaTicket(monto_ticket_sug, propina_ticket_sug, total_ticket_sug, alertaPropinaTicketSug)">
													</div>
												</td>
												<td>Total:</td>
												<td><p class="text" id="total_ticket_sug">0.00</p></td>
											</tr>
											<tr style="height: 75px;">
												<td>Comentarios:</td>
												<td colspan="6">
													<div class="form-group">
														<label class="sr-only" for="comment">Comentario:</label> <input
															type="text" class="form-control" id="ticketComment"
															placeholder="Ingresa Comentarios" />
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="text-center" id="alertaPropinaTicketSug"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning"
											id="vincularButtonIdTicket" href="#">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Tickets -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL AGREGA COMPROBANTE SUGERIDO #1 -->







			<!-- MODAL AGREGA COMPROBANTE GENERAL #1 -->
			<div class="modal fade" id="modalComprobanteGral" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">


							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a href="#tabFacturasGral" role="tab"
									data-toggle="tab">Facturas</a></li>
								<li><a href="#tabTicketsGral" role="tab" data-toggle="tab">Ticket</a></li>
							</ul>

							<div class="tab-content">
								<!-- TAB Facturas -->
								<div role="tabpanel" class="tab-pane active"
									id="tabFacturasGral">

									<!--TABLA DE FACTURAS MISMO USUARIO-->
									<table class="table table-striped">
										<thead>
											<tr>
												<th style="width: 80px;">Folio</th>
												<th style="width: 100px;">Fecha</th>
												<th>RFC Emisor</th>
												<th style="width: 80px;" class="text-center">Monto</th>
												<th style="width: 150px;" class="text-center">Propina</th>
												<th style="width: 80px;" class="text-center">Total</th>
												<th style="width: 40px;">Asociar</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>987534</td>
												<td>11/04/2015</td>
												<td>SORIANA SA CV</td>
												<td><p class="text-right" id="monto_G01">345.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_G01"
															oninput="propinaFunction(monto_G01, propina_G01, total_G01, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_G01">345.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>76534</td>
												<td>19/04/2015</td>
												<td>RESTAURANTE EL CAPITAN SA CV</td>
												<td><p class="text-right" id="monto_G02">750.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_G02"
															oninput="propinaFunction(monto_G02, propina_G02, total_G02, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_G02">750.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>654373</td>
												<td>20/04/2015</td>
												<td>HOTEL DE MEXICO SA CV</td>
												<td><p class="text-right" id="monto_G03">1250.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_G03"
															oninput="propinaFunction(monto_G03, propina_G03, total_G03, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_G03">1250.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura" />
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<!--TERMINA TABLA DE FACTURAS MISMO USUARIO-->


									<!-- ACORDEON PARA TABLA DE MAS FACTURAS-->
									<div class="panel-group" id="accordion" role="tablist"
										aria-multiselectable="true">

										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingTwo">
												<h4 class="panel-title">
													<a class="collapsed" data-toggle="collapse"
														data-parent="#accordion" href="#collapseTwo"
														aria-expanded="false" aria-controls="collapseTwo"> Ver
														facturas de otros usuarios </a>
												</h4>
											</div>
											<div id="collapseTwo" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingTwo">
												<div class="panel-body">


													<!--TABLA DE FACTURAS MISMO USUARIO-->
													<table class="table table-striped">
														<thead>
															<tr>
																<th style="width: 100px;">Usuario</th>
																<th style="width: 70px;">Tarjeta</th>
																<th style="width: 80px;">Folio</th>
																<th style="width: 80px;">Fecha</th>
																<th>RFC Emisor</th>
																<th style="width: 80px;" class="text-center">Monto</th>
																<th style="width: 150px;" class="text-center">Propina</th>
																<th style="width: 80px;" class="text-center">Total</th>
																<th style="width: 30px;">Asociar</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>Mariana Cantú</td>
																<td>876234579</td>
																<td>987534</td>
																<td>11/04/2015</td>
																<td>SORIANA SA CV</td>
																<td><p class="text-right" id="monto_OTH_01">345.00</p></td>
																<td>
																	<div class="input-group">
																		<span class="input-group-addon">$</span> <input
																			type="text" class="form-control"
																			aria-label="Amount (to the nearest dollar)"
																			id="propina_OTH_01"
																			oninput="propinaFunction(monto_OTH_01, propina_OTH_01, total_OTH_01, alertaPropinaFacGral)">
																	</div>
																</td>
																<td><p class="text-right" id="total_OTH_01">345.00</p></td>
																<td>
																	<div class="radio">
																		<input type="radio"
																			style="vertical-align: up; margin: 0px;"
																			name="radioFactura">
																	</div>
																</td>
															</tr>
															<tr>
																<td>Mariana Cantú</td>
																<td>876234579</td>
																<td>76534</td>
																<td>19/04/2015</td>
																<td>RESTAURANTE EL CAPITAN SA CV</td>
																<td><p class="text-right" id="monto_OTH_02">750.00</p></td>
																<td>
																	<div class="input-group">
																		<span class="input-group-addon">$</span> <input
																			type="text" class="form-control"
																			aria-label="Amount (to the nearest dollar)"
																			id="propina_OTH_02"
																			oninput="propinaFunction(monto_OTH_02, propina_OTH_02, total_OTH_02, alertaPropinaFacGral)">
																	</div>
																</td>
																<td><p class="text-right" id="total_OTH_02">750.00</p></td>
																<td>
																	<div class="radio">
																		<input type="radio"
																			style="vertical-align: up; margin: 0px;"
																			name="radioFactura">
																	</div>
																</td>
															</tr>
															<tr>
																<td>Mariana Cantú</td>
																<td>876234579</td>
																<td>654373</td>
																<td>20/04/2015</td>
																<td>HOTEL DE MEXICO SA CV</td>
																<td><p class="text-right" id="monto_OTH_03">1250.00</p></td>
																<td>
																	<div class="input-group">
																		<span class="input-group-addon">$</span> <input
																			type="text" class="form-control"
																			aria-label="Amount (to the nearest dollar)"
																			id="propina_OTH_03"
																			oninput="propinaFunction(monto_OTH_03, propina_OTH_03, total_OTH_03, alertaPropinaFacGral)">
																	</div>
																</td>
																<td><p class="text-right" id="total_OTH_03">1250.00</p></td>
																<td>
																	<div class="radio">
																		<input type="radio"
																			style="vertical-align: up; margin: 0px;"
																			name="radioFactura" />
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
													<!--TERMINA TABLA DE FACTURAS MISMO USUARIO-->

												</div>
											</div>
										</div>
									</div>
									<!-- TERMINA ACORDEON PARA TABLA DE MAS FACTURAS-->

									<!--<h3>Tabla de Comentarios</h3>-->
									<table class="table">
										<thead>
										</thead>
										<tbody>
											<tr>
												<td style="width: 120px;">Comentarios:</td>
												<td>
													<div class="form-group">
														<label class="sr-only" for="comment">Comentario:</label> <input
															type="text" class="form-control" id="date"
															placeholder="Ingresa Comentarios" />
													</div>
												</td>
											</tr>
										</tbody>
									</table>

									<p class="text-center" id="alertaPropinaFacGral"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning"
											href="7_justificante_detalle_1.html">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Facturas -->
								<!-- TAB Tickets -->
								<div role="tabpanel" class="tab-pane" id="tabTicketsGral">
									<table class="table">
										<thead>
											<tr>
												<td colspan="6"><h5>Ingresa datos de ticket</h5></td>
											</tr>
										</thead>
										<tbody>
											<tr style="height: 75px;">
												<td style="width: 100px;">Fecha:</td>
												<td style="width: 200px;">
													<div class="form-group">
														<div class="input-group date" id="datetimepicker1">
															<input type="text" class="form-control"
																data-provide="datepicker"> <span
																class="input-group-addon"> <span
																class="glyphicon glyphicon-calendar"></span>
															</span>
														</div>
													</div>
												</td>
												<td style="width: 100px;">Ticket:</td>
												<td style="width: 200px;"><span
													class="btn btn-default btn-file"> <span
														class="glyphicon glyphicon-folder-open" aria-hidden="true">
															Explorar <input type="file">
													</span>
												</span></td>
											</tr>
											<tr style="height: 75px;">
												<td>Monto:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="monto_ticket_gral"
															oninput="propinaTicket(monto_ticket_gral, propina_ticket_gral, total_ticket_gral, alertaPropinaTicketGral)">
													</div>
												</td>
												<td>Propina:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_ticket_gral"
															oninput="propinaTicket(monto_ticket_gral, propina_ticket_gral, total_ticket_gral, alertaPropinaTicketGral)">
													</div>
												</td>
												<td>Total:</td>
												<td><p class="text" id="total_ticket_gral">0.00</p></td>
											</tr>
											<tr style="height: 75px;">
												<td>Comentarios:</td>
												<td colspan="5">
													<div class="form-group">
														<label class="sr-only" for="comment">Comentario:</label> <input
															type="text" class="form-control" id="date"
															placeholder="Ingresa Comentarios">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="text-center" id="alertaPropinaTicketGral"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning" href="#">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Tickets -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL AGREGA COMPROBANTE GENERAL #1 -->










			<!-- MODAL AGREGA COMPROBANTE -->
			<div class="modal fade" id="modalComprobante" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">


							<ul class="nav nav-tabs" role="tablist">
								<li class="active"><a href="#tabFacturas" role="tab"
									data-toggle="tab">Facturas</a></li>
								<li><a href="#tabTickets" role="tab" data-toggle="tab">Ticket</a></li>
							</ul>

							<div class="tab-content">
								<!-- TAB Facturas -->
								<div role="tabpanel" class="tab-pane active" id="tabFacturas">

									<!--<h3>Transacciones Conciliadas</h3>-->
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Folio</th>
												<th>Fecha</th>
												<th>RFC Emisor</th>
												<th class="text-center">Monto</th>
												<th class="text-center">Propina</th>
												<th class="text-center">Total</th>
												<th>Asociar</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>987534</td>
												<td>11/04/2015</td>
												<td>SORIANA SA CV</td>
												<td><p class="text-right">$ 345.00</p></td>
												<td style="width: 150px;">
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)">
													</div>
												</td>
												<td><p class="text-right">$ 379.50</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>76534</td>
												<td>19/04/2015</td>
												<td>RESTAURANTE EL CAPITAN SA CV</td>
												<td><p class="text-right">$ 750.00</p></td>
												<td style="width: 150px;">
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)">
													</div>
												</td>
												<td><p class="text-right">$ 379.50</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>654373</td>
												<td>20/04/2015</td>
												<td>HOTEL DE MEXICO SA CV</td>
												<td><p class="text-right">$ 1,250.00</p></td>
												<td style="width: 150px;">
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)" />
													</div>
												</td>
												<td><p class="text-right">$ 379.50</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura" />
													</div>
												</td>
											</tr>
											<tr>
												<td>Comentarios:</td>
												<td colspan="6">
													<div class="form-group">
														<label class="sr-only" for="comment">Comentario:</label> <input
															type="text" class="form-control" id="date"
															placeholder="Ingresa Comentarios" />
													</div>
												</td>
											</tr>
										</tbody>

									</table>
									<br />
									<p class="text-center">
										<a type="button" class="btn btn-warning"
											href="7_justificante_detalle_1.html">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Facturas -->
								<!-- TAB Tickets -->
								<div role="tabpanel" class="tab-pane" id="tabTickets">
									<table class="table">
										<thead>
											<tr>
												<td colspan="6"><h5>Ingresa datos de ticket</h5></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="width: 100px;">Fecha:</td>
												<td style="width: 200px;">
													<div class="form-group">
														<div class='input-group date' id='datetimepicker1'>
															<input type='text' class="form-control" /> <span
																class="input-group-addon"> <span
																class="glyphicon glyphicon-calendar"></span>
															</span>
														</div>
													</div>
												</td>
												<td style="width: 100px;">Ticket:</td>
												<td style="width: 200px;"><span
													class="btn btn-default btn-file"> <span
														class="glyphicon glyphicon-folder-open" aria-hidden="true">
															Explorar <input type="file">
													</span>
												</span></td>
											</tr>
											<tr>
												<td>Monto:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control" aria-label="Monto"
															id="ticketMonto" placeholder="Ingresa Monto">
													</div>
												</td>
												<td>Propina:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control" aria-label="Monto"
															id="ticketPropina" placeholder="Ingresa Monto">
													</div>
												</td>
												<td>Total:</td>
												<td><p class="text">$ 345.00</p></td>
											</tr>
											<tr>
												<td>Comentarios:</td>
												<td colspan="5">
													<div class="form-group">
														<label class="sr-only" for="comment">Comentario:</label> <input
															type="text" class="form-control" id="date"
															placeholder="Ingresa Comentarios">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="text-center">
										<a type="button" class="btn btn-warning" href="#">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Tickets -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA AGREGA COMPROBANTE -->







			<!-- MODAL VINCULAR FACTURAS #3-->
			<div class="modal fade" id="modalVinc_Facturas3_old" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Facturas
								Pendientes</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<!--<h3>Transacciones Conciliadas</h3>-->
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Folio</th>
											<th>Fecha</th>
											<th>RFC Emisor</th>
											<th class="text-center">Monto</th>
											<th>Asociar</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>987534</td>
											<td>11/04/2015</td>
											<td>SORIANA SA CV</td>
											<td><p class="text-right">$ 345.00</p></td>
											<td>
												<div class="radio">
													<input type="radio"
														style="vertical-align: up; margin: 0px;"
														name="radioFactura">
												</div>
											</td>
										</tr>
										<tr>
											<td>76534</td>
											<td>19/04/2015</td>
											<td>RESTAURANTE EL CAPITAN SA CV</td>
											<td><p class="text-right">$ 750.00</p></td>
											<td>
												<div class="radio">
													<input type="radio"
														style="vertical-align: up; margin: 0px;"
														name="radioFactura">
												</div>
											</td>
										</tr>
										<tr>
											<td>654373</td>
											<td>20/04/2015</td>
											<td>HOTEL DE MEXICO SA CV</td>
											<td><p class="text-right">$ 1,250.00</p></td>
											<td>
												<div class="radio">
													<input type="radio"
														style="vertical-align: up; margin: 0px;"
														name="radioFactura">
												</div>
											</td>
										</tr>
									</tbody>

								</table>
								<p class="text-center">
									<a type="button" class="btn btn-warning"
										href="2_transacciones_1.html">Vincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL VINCULAR FACTURAS -->

			<!-- MODAL VINCULAR FACTURAS #2-->
			<div class="modal fade" id="modalVinc_Facturas2" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Facturas
								Pendientes</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<!--<h3>Transacciones Conciliadas</h3>-->
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Folio</th>
											<th>Fecha</th>
											<th>RFC Emisor</th>
											<th class="text-center">Monto</th>
											<th>Asociar</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>987534</td>
											<td>11/04/2015</td>
											<td>SORIANA SA CV</td>
											<td><p class="text-right">$ 345.00</p></td>
											<td>
												<div class="radio">
													<input type="radio"
														style="vertical-align: up; margin: 0px;"
														name="radioFactura">
												</div>
											</td>
										</tr>
										<tr>
											<td>76534</td>
											<td>19/04/2015</td>
											<td>RESTAURANTE EL CAPITAN SA CV</td>
											<td><p class="text-right">$ 750.00</p></td>
											<td>
												<div class="radio">
													<input type="radio"
														style="vertical-align: up; margin: 0px;"
														name="radioFactura">
												</div>
											</td>
										</tr>
									</tbody>

								</table>
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Vincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL VINCULAR FACTURAS -->

			<!-- MODAL VINCULAR FACTURAS #1-->
			<div class="modal fade" id="modalVinc_Facturas1" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Facturas
								Pendientes</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<!--<h3>Transacciones Conciliadas</h3>-->
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Folio</th>
											<th>Fecha</th>
											<th>RFC Emisor</th>
											<th class="text-center">Monto</th>
											<th>Asociar</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>987534</td>
											<td>11/04/2015</td>
											<td>SORIANA SA CV</td>
											<td><p class="text-right">$ 345.00</p></td>
											<td>
												<div class="radio">
													<input type="radio"
														style="vertical-align: up; margin: 0px;"
														name="radioFactura">
												</div>
											</td>
										</tr>
									</tbody>

								</table>
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Vincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL VINCULAR FACTURAS -->






			<!-- MODAL DETALLE FACTURA #1-->
			<div class="modal fade" id="modalDetalleFactura1" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'CAPITAL JEANS SA CV'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>8763456</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>CAJE56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>02/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 756.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #1-->




			<!-- MODAL DETALLE FACTURA #2-->
			<div class="modal fade" id="modalDetalleFactura2" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'POLMAL SA CV'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>237895</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>POLM56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>04/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 1,345.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #2 -->



			<!-- MODAL DETALLE FACTURA #3 -->
			<div class="modal fade" id="modalDetalleFactura3" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'7 ELEVEN MÉXICO SA CV'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>98765</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>SEVE56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>05/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 58.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #3 -->


			<!-- MODAL DETALLE FACTURA #5A-->
			<div class="modal fade" id="modalDetalleFactura5A" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'RETIRO DE EFECTIVO'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>3456</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>CAJE56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>13/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 900.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #5A-->


			<!-- MODAL DETALLE FACTURA #5B-->
			<div class="modal fade" id="modalDetalleFactura5B" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'RETIRO DE EFECTIVO'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>654456</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>SEV56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>14/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 600.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #5B-->

			<!-- MODAL DETALLE FACTURA #NuevaA-->
			<div class="modal fade" id="modalDetalleFacturaNuevaA" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'RETIRO DE EFECTIVO'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>8734569</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>SEV56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>20/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 1,250.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #Nueva -->



			<!-- MODAL DETALLE FACTURA #NuevaB-->
			<div class="modal fade" id="modalDetalleFacturaNuevaB" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Detalle de Factura</h4>
						</div>
						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">

								<table class="table table-striped">
									<tbody>
										<tr>
											<td>Vinculada a:</td>
											<td>'RETIRO DE EFECTIVO'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>875645</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>SEV56789HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>21/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 750.00</td>
										</tr>

										<tr>
											<td>Factura:</td>
											<td><a href="#"> <img src="img/xml.png" alt="XML"
													style="width: 20px; height: 20px">
											</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
													style="width: 20px; height: 20px">
											</a></td>
										</tr>

									</tbody>
								</table>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning" href="#">Desvincular</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL DETALLE FACTURA #Nueva -->

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
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-filestyle.min.js">
		
	</script>
	<script>
		var d = new Date();
		document.getElementById("date").innerHTML = d.toDateString();
	</script>
	<script>
		function propinaFunction(montoId, propinaId, totalId, alertaId) {
			var total = 0;
			var monto = parseFloat(montoId.innerHTML);
			var propina = parseFloat(propinaId.value);

			//add only if the value is number
			if (isNaN(monto) || monto.length == 0) {
				monto = 0;
			}

			if (isNaN(propina) || propina.length == 0) {
				propina = 0;
			}

			var maximaProp = monto * 0.2;
			total = monto + propina;
			totalId.innerHTML = total.toFixed(2);
			if (parseFloat(propina) <= parseFloat(maximaProp)) {
				alertaId.innerHTML = "";
				vincularButtonIdFac.prop("disabled", false);
				document.getElementById("vincularButtonIdFac").prop("disabled",
						false);
			} else {
				alertaId.innerHTML = "Propina máxima de 20%";
				vincularButtonIdFac.prop("disabled", true);
				document.getElementById("vincularButtonIdFac").prop("disabled",
						true);
			}

		}
	</script>
	<script>
		function propinaTicket(montoId, propinaId, totalId, alertaId) {
			var total = 0;
			var monto = parseFloat(montoId.value);
			var propina = parseFloat(propinaId.value);

			//add only if the value is number
			if (isNaN(monto) || monto.length == 0) {
				monto = 0;
			}

			if (isNaN(propina) || propina.length == 0) {
				propina = 0;
			}

			var maximaProp = monto * 0.2;
			total = monto + propina;
			totalId.innerHTML = total.toFixed(2);
			if (parseFloat(propina) <= parseFloat(maximaProp)) {
				alertaId.innerHTML = "";
				vincularButtonIdTicket.attr("disabled", false);
				vincularButtonIdTicket.prop("disabled", false);
				document.getElementById("vincularButtonIdTicket").attr(
						"disabled", false);
				document.getElementById("vincularButtonIdTicket").prop(
						"disabled", false);
			} else {
				alertaId.innerHTML = "Propina máxima de 20%";
				vincularButtonIdTicket.attr("disabled", true);
				vincularButtonIdTicket.prop("disabled", true);
				document.getElementById("vincularButtonIdTicket").attr(
						"disabled", true);
				document.getElementById("vincularButtonIdTicket").prop(
						"disabled", true);
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$('.datepicker').datepicker();
		});
	</script>
</body>
</html>
