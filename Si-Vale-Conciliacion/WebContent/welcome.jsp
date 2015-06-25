<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

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

<script type="text/javascript" src="js/angular.min.js"></script>
<script>
	var app = angular.module('myApp', []);

	app.controller('MyController', [
			'$scope',
			'$http',
			function MyController($scope, $http) {
				$scope.getDataFromServer = function() {
					$http.get('angularAction').success(
							function(data, status, headers, config) {
								$scope.transaction = data;
								console.log($scope.trans);
							}).error(function(data, status, headers, config) {
					});
				};
			} ]);
</script>

</head>
<body>


	<!-- Wrap all page content here -->
	<div id="wrap">

		<!-- Top Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img alt="Brand"
						src="img/logo-nav.png">
					</a>
				</div>
				<div class="collapse navbar-collapse navbar-right">
					<ul class="nav navbar-nav">
						<p class="navbar-text" id="date"></p>
					</ul>
					<ul class="nav navbar-nav">
						<li><a><s:property value="name"></s:property></a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li><a href="login.html"> <span
								class="glyphicon glyphicon-log-out" aria-hidden="true">Salir</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End of Top Fixed navbar -->


		<!-- MAIN CONTAINER 
    =========================================== -->
		<div class="container container-xs">
			<!-- Grid for Panel and Banner -->
			<div class="row">

				<!-- Col for Panel -->
				<div class="col-md-10">
					<div data-ng-app="myApp">
						<div data-ng-controller="MyController">
							<div class="row">
								<div class="col-md-6">
									<br />
									<h5>Tarjeta: 2364 0015 3816 4532</h5>
								</div>
								<div class="col-md-6">
									<span class="pull-right">
										<div class="navbar">
											<ul class="nav navbar-nav navbar-default">
												<li><a href="1_resumen_0.html" class="btn-sm">Resumen</a></li>
												<li class="active"><a href="2_transacciones_0.html">Mis
														Movimientos <span class="sr-only">(current)</span>
												</a></li>
												<li><a href="6_justificantes_0.html" class="btn-sm">Mis
														Justificantes</a></li>
											</ul>
										</div>
									</span>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8">
									<h4>Movimientos de mi tarjeta</h4>
								</div>
								<div class="col-md-4">
									<span class="pull-right">
										<ul class="nav nav-pills">
											<li><a data-ng-click="getDataFromServer()">Ver
													facturas no conciliadas</a></li>
										</ul>
									</span>
								</div>
							</div>

							<br />

							<!-- Grid for Table content -->
							<div class="row">
								<div class="col-md-12">

									<!-- Data Table Panel-->
									<div class="panel panel-default">
										<div class="panel-heading">

											<div class="row">
												<div class="col-md-6">
													<h3 class="panel-title">Detalle transacciones</h3>
												</div>
												<!-- End of Table Header Left -->
												<!-- Table Header right -->
												<div class="col-md-6" aligne="right">
													<span class="pull-right"> Periodo:
														<button class="btn btn-default dropdown-toggle"
															type="button" id="dropdownMenuPeriodo"
															data-toggle="dropdown" aria-expanded="true">
															Actual<span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu"
															aria-labelledby="dropdownMenu1">
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#">Mes anterior</a></li>
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#">Dos meses atr��s</a></li>
															<li role="presentation"><a role="menuitem"
																tabindex="-1" href="#">Tres meses atr��s</a></li>
														</ul>
													</span>
												</div>
												<!-- End of Table Header right -->
											</div>

										</div>

										<div class="panel-body">

											<div class="table-responsive">

												<table class="table table-striped">
													<!-- 											<thead> -->
													<tr>
														<th style="width: 60px;">Id</th>
														<th style="width: 80px;">Fecha</th>
														<th>Establecimiento</th>
														<th style="width: 100px;" class="text-center">Monto</th>
														<th style="width: 100px;" class="text-center">Saldo</th>
														<th style="width: 80px;">Justificante</th>
														<th style="width: 60px;">Estatus</th>
													</tr>
													<tr data-ng-repeat="trans in transaction">
														<td>{{trans.id}}</td>
														<td>{{trans.fecha}}</td>
														<td>{{trans.establecimiento}}</td>
														<td>{{trans.monto}}</td>
														<td>{{trans.saldo}}</td>
														<td>{{trans.justificante}}</td>
														<td>{{trans.estatus}}</td>
													</tr>

												</table>
											</div>
										</div>
									</div>
									<!-- End of Data Table Panel-->
								</div>
							</div>
							<!-- End of Grid for Table content -->
						</div>
					</div>
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


			<!-- MODAL AGREGA COMPROBANTE SUGERIDO #1 -->
			<div class="modal fade" id="modalComprobanteSug_1" tabindex="-1"
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
								<li class="active"><a href="#tabFacturasSug" role="tab"
									data-toggle="tab">Facturas</a></li>
								<li><a href="#tabTicketsSug" role="tab" data-toggle="tab">Ticket</a></li>
							</ul>

							<div class="tab-content">
								<!-- TAB Facturas -->
								<div role="tabpanel" class="tab-pane active" id="tabFacturasSug">

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
												<td>31212</td>
												<td>26/04/2015</td>
												<td>RESTAURANTE CHILIS SA DE CV <span
													class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S11">463.50</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S11"
															oninput="propinaFunction(monto_S11, propina_S11, total_S11, alertaPropinaFacSug)">
													</div>
												</td>
												<td><p class="text-right" id="total_S11">463.50</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>43242</td>
												<td>27/04/2015</td>
												<td>RESTAURANTE CHILIS SA DE CV <span
													class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S12">490.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S12"
															oninput="propinaFunction(monto_S12, propina_S12, total_S12, alertaPropinaFacSug)">
													</div>
												</td>
												<td><p class="text-right" id="total_S12">490.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>87578</td>
												<td>29/04/2015</td>
												<td>WINGS AS 32<span class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S13">500.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S13"
															oninput="propinaFunction(monto_S13, propina_S13, total_S13, alertaPropinaFacSug)">
													</div>
												</td>
												<td><p class="text-right" id="total_S13">500.00</p></td>
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
									<!--TERMINA TABLA DE FACTURAS MISMO USUARIO-->

									<!--<h3>Tabla de Comentarios</h3>-->
									<table class="table">
										<thead>
										</thead>
										<tbody>
											<tr>
												<td style="width: 120px;">Comentarios:</td>
												<td colspan="6">
													<div class="form-group">
														<textarea class="form-control" id="message-text"></textarea>
													</div>
												</td>
											</tr>
										</tbody>
									</table>

									<p class="text-center" id="alertaPropinaFacSug"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning"
											href="2_transacciones_1.html">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Facturas -->
								<!-- TAB Tickets -->
								<div role="tabpanel" class="tab-pane" id="tabTicketsSug">
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
												<td colspan="5">
													<div class="form-group">
														<textarea class="form-control" id="message-text"></textarea>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="text-center" id="alertaPropinaTicketSug"
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
			<!--TERMINA MODAL AGREGA COMPROBANTE SUGERIDO #1 -->


			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->


			<!-- MODAL AGREGA COMPROBANTE SUGERIDO #2 -->
			<div class="modal fade" id="modalComprobanteSug_2" tabindex="-1"
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
								<li class="active"><a href="#tabFacturasSug2" role="tab"
									data-toggle="tab">Facturas</a></li>
								<li><a href="#tabTicketsSug2" role="tab" data-toggle="tab">Ticket</a></li>
							</ul>

							<div class="tab-content">
								<!-- TAB Facturas -->
								<div role="tabpanel" class="tab-pane active"
									id="tabFacturasSug2">

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
												<td>02/05/2015</td>
												<td>SUSHI ROLL SA DE CV<span class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S21">148.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S21"
															oninput="propinaFunction(monto_S21, propina_S21, total_S21, alertaPropinaFacSug2)">
													</div>
												</td>
												<td><p class="text-right" id="total_S21">148.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>987534</td>
												<td>03/05/2015</td>
												<td>SUSHI ROLL SA DE CV<span class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S22">150.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S22"
															oninput="propinaFunction(monto_S22, propina_S22, total_S22, alertaPropinaFacSug2)">
													</div>
												</td>
												<td><p class="text-right" id="total_S22">150.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>987534</td>
												<td>01/05/2015</td>
												<td>OXXO GONZALEZ C.<span class="label label-danger">Sugerida</span></td>
												<td><p class="text-right" id="monto_S23">152.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_S23"
															oninput="propinaFunction(monto_S23, propina_S23, total_S23, alertaPropinaFacSug2)">
													</div>
												</td>
												<td><p class="text-right" id="total_S23">152.00</p></td>
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
									<!--TERMINA TABLA DE FACTURAS MISMO USUARIO-->

									<!--<h3>Tabla de Comentarios</h3>-->
									<table class="table">
										<thead>
										</thead>
										<tbody>
											<tr>
												<td style="width: 120px;">Comentarios:</td>
												<td colspan="6">
													<div class="form-group">
														<textarea class="form-control" id="message-text"></textarea>
													</div>
												</td>
											</tr>
										</tbody>
									</table>

									<p class="text-center" id="alertaPropinaFacSug2"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning" href="">Vincular</a>
									</p>
								</div>
								<!-- Termina TAB Facturas -->
								<!-- TAB Tickets -->
								<div role="tabpanel" class="tab-pane" id="tabTicketsSug2">
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
															id="monto_ticket_sug2"
															oninput="propinaTicket(monto_ticket_sug2, propina_ticket_sug2, total_ticket_sug2, alertaPropinaTicketSug2)">
													</div>
												</td>
												<td>Propina:</td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_ticket_sug2"
															oninput="propinaTicket(monto_ticket_sug2, propina_ticket_sug2, total_ticket_sug2, alertaPropinaTicketSug2)">
													</div>
												</td>
												<td>Total:</td>
												<td><p class="text" id="total_ticket_sug2">0.00</p></td>
											</tr>
											<tr style="height: 75px;">
												<td>Comentarios:</td>
												<td colspan="5">
													<div class="form-group">
														<textarea class="form-control" id="message-text"></textarea>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="text-center" id="alertaPropinaTicketSug2"
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
			<!--TERMINA MODAL AGREGA COMPROBANTE SUGERIDO #1 -->


			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
												<td>23712</td>
												<td>03/05/2015</td>
												<td>SUSHI ROLL SA DE CV</td>
												<td><p class="text-right" id="monto_GS22">148.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_GS22"
															oninput="propinaFunction(monto_GS22, propina_GS22, total_GS22, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_GS22">148.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>56823</td>
												<td>02/05/2015</td>
												<td>SUSHI ROLL SA DE CV</td>
												<td><p class="text-right" id="monto_GS21">150.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_GS21"
															oninput="propinaFunction(monto_GS21, propina_GS21, total_GS21, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_GS21">150.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>23435</td>
												<td>01/05/2015</td>
												<td>OXXO GONZALEZ C.</td>
												<td><p class="text-right" id="monto_GS23">152.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_GS23"
															oninput="propinaFunction(monto_GS23, propina_GS23, total_GS23, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_GS23">152.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>98752</td>
												<td>29/04/2015</td>
												<td>WINGS AS 32</td>
												<td><p class="text-right" id="monto_GS13">500.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_GS13"
															oninput="propinaFunction(monto_GS13, propina_GS13, total_GS13, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_GS13">500.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>87562</td>
												<td>27/04/2015</td>
												<td>RESTAURANTE CHILIS SA DE CV</td>
												<td><p class="text-right" id="monto_GS12">490.00</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_GS12"
															oninput="propinaFunction(monto_GS12, propina_GS12, total_GS12, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_GS12">490.00</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>87459</td>
												<td>26/04/2015</td>
												<td>RESTAURANTE CHILIS SA DE CV</td>
												<td><p class="text-right" id="monto_GS11">463.50</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_GS11"
															oninput="propinaFunction(monto_GS11, propina_GS11, total_GS11, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_GS11">463.50</p></td>
												<td>
													<div class="radio">
														<input type="radio"
															style="vertical-align: up; margin: 0px;"
															name="radioFactura">
													</div>
												</td>
											</tr>
											<tr>
												<td>987534</td>
												<td>26/04/2015</td>
												<td>RESTAURANTE CHILIS SA DE CV</td>
												<td><p class="text-right" id="monto_G01">463.50</p></td>
												<td>
													<div class="input-group">
														<span class="input-group-addon">$</span> <input
															type="text" class="form-control"
															aria-label="Amount (to the nearest dollar)"
															id="propina_G01"
															oninput="propinaFunction(monto_G01, propina_G01, total_G01, alertaPropinaFacGral)">
													</div>
												</td>
												<td><p class="text-right" id="total_G01">463.50</p></td>
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
										</tbody>
									</table>
									<!--TERMINA TABLA DE FACTURAS MISMO USUARIO-->

									<!--<h3>Tabla de Comentarios</h3>-->
									<table class="table">
										<thead>
										</thead>
										<tbody>
											<tr>
												<td style="width: 120px;">Comentarios:</td>
												<td colspan="6">
													<div class="form-group">
														<textarea class="form-control" id="message-text"></textarea>
													</div>
												</td>
											</tr>
										</tbody>
									</table>

									<p class="text-center" id="alertaPropinaFacGral"
										style="color: red; font-size: 120%"></p>
									<p class="text-center">
										<a type="button" class="btn btn-warning"
											href="2_transacciones_2.html">Vincular</a>
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
														<textarea class="form-control" id="message-text"></textarea>
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

			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
											<td>25/04/2015 10:32:54</td>
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


			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
											<td>25/04/2015 10:32:54</td>
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


			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
											<td>'7 ELEVEN M��XICO SA CV'</td>
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
											<td>25/04/2015 10:32:54</td>
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

			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

			<!-- MODAL DETALLE FACTURA #4 -->
			<div class="modal fade" id="modalDetalleFactura4" tabindex="-1"
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
											<td>'RESTAURANTE CHILIS'</td>
										</tr>
										<tr>
											<td>Folio:</td>
											<td>987534</td>
										</tr>
										<tr>
											<td>RFC:</td>
											<td>CHIL8756HDF</td>
										</tr>
										<tr>
											<td>Fecha:</td>
											<td>26/04/2015 10:32:54</td>
										</tr>
										<tr>
											<td>Monto:</td>
											<td>$ 463.50</td>
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
			<!--TERMINA MODAL DETALLE FACTURA #4 -->

			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
											<td>27/04/2015 10:32:54</td>
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

			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
											<td>27/04/2015 10:32:54</td>
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


			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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


			<!-- ==================================================
                    NEW MODAL 
    ================================================== -->

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
			} else {
				alertaId.innerHTML = "Propina m��xima de 20%";
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
			} else {
				alertaId.innerHTML = "Propina m��xima de 20%";
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






<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<%-- <%-- Using Struts2 Tags in JSP --%>
<%-- <%@ taglib uri="/struts-tags" prefix="s"%> --%>
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII"> -->
<!-- <title>Login Page</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- <h3>Welcome User, please login below</h3> -->
<%-- <s:form action="login"> --%>
<%-- 	<s:textfield name="name" label="User Name"></s:textfield> --%>
<%-- 	<s:textfield name="pwd" label="Password" type="password"></s:textfield> --%>
<%-- 	<s:submit value="Login"></s:submit> --%>
<%-- </s:form> --%>
<!-- </body> -->
<!-- </html> -->