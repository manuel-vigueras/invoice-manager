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








						<ul class="nav nav-tabs" role="tablist">
							<li class="active"><a href="#tabFacturas" role="tab"
								data-toggle="tab">Facturas</a></li>
							<li><a href="#tabHistorial" role="tab" data-toggle="tab">Historial</a></li>
						</ul>

						<div class="tab-content">


							<!-- TAB Usuarios -->
							<div role="tabpanel" class="tab-pane active" id="tabFacturas">

								<!-- Data Table Panel-->
								<div class="panel panel-default">

									<div class="panel-heading">
										<div class="row">
											<div class="col-md-6">
												<h3 class="panel-title">Facturas conciliadas</h3>
												<br /> Periodo:
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
														tabindex="-1" href="#">Dos meses atrás</a></li>
													<li role="presentation"><a role="menuitem"
														tabindex="-1" href="#">Tres meses atrás</a></li>
												</ul>
											</div>

											<div class="col-md-6">
												<div class="btn-group-vertical pull-right" role="group"
													aria-label="...">
													<button type="button" class="btn btn-default"
														data-toggle="modal" data-target="#modalAnexo24">
														<span class="glyphicon glyphicon-open-file"
															aria-hidden="true"></span> Generar Anexo
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
														<th style="width: 120px;">Usuario</th>
														<th style="width: 100px;">Tarjeta</th>
														<th style="width: 80px;">Folio</th>
														<th style="width: 100px;">Fecha</th>
														<th>RFC Emisor</th>
														<th class="text-right" style="width: 100px;">Monto</th>
														<th style="width: 120px;">Validación SAT</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Mariana Cantú</td>
														<td>876234579</td>
														<td>987534</td>
														<td>11/04/2015</td>
														<td>SORIANA SA CV</td>
														<td><p class="text-right">$ 345.00</p></td>
														<td><span class="label label-success">válido</span></td>
													</tr>
													<tr>
														<td>Mariana Cantú</td>
														<td>876234579</td>
														<td>76534</td>
														<td>19/04/2015</td>
														<td>RESTAURANTE EL CAPITAN SA CV</td>
														<td><p class="text-right">$ 750.00</p></td>
														<td><span class="label label-success">válido</span></td>
													</tr>
													<tr>
														<td>Mariana Cantú</td>
														<td>876234579</td>
														<td>654373</td>
														<td>20/04/2015</td>
														<td>HOTEL DE MEXICO SA CV</td>
														<td><p class="text-right">$ 1,250.00</p></td>
														<td><span class="label label-danger">inválido</span></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- End of Data Table Panel-->
							</div>
							<!-- TERMINA TAB FACTURAS -->







							<!-- TAB HISTORIAL -->
							<div role="tabpanel" class="tab-pane" id="tabHistorial">

								<!-- Data Table Panel-->
								<div class="panel panel-default">

									<div class="panel-heading">
										<div class="row">
											<div class="col-md-6">
												<h3 class="panel-title">Anexo 24</h3>
												<br />
											</div>
										</div>
									</div>

									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-striped">
												<thead>
													<tr>
														<th style="width: 180px;">Mes</th>
														<th style="width: 180px;">Archivo</th>
														<th style="width: 180px;">Descarga</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2015 Enero</td>
														<td>Anexo_24</td>
														<td><a data-toggle="modal"
															data-target="#modalDetalleFactura3"> <img
																src="img/xml.png" alt="XML"
																style="width: 20px; height: 20px">
														</a></td>
													</tr>
													<tr>
														<td>2015 Febrero</td>
														<td>Anexo_24</td>
														<td><a data-toggle="modal"
															data-target="#modalDetalleFactura3"> <img
																src="img/xml.png" alt="XML"
																style="width: 20px; height: 20px">
														</a></td>
													</tr>
													<tr>
														<td>2015 Marzo</td>
														<td>Anexo_24</td>
														<td><a data-toggle="modal"
															data-target="#modalDetalleFactura3"> <img
																src="img/xml.png" alt="XML"
																style="width: 20px; height: 20px">
														</a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- End of Data Table Panel-->
							</div>
							<!-- TERMINA TAB HISTORIAL -->

						</div>
						<!-- TERMINA TAB Content -->

					</div>
					<!-- TERMINA ROW de botones -->























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




			<!-- MODAL VALIDACION SAT -->
			<div class="modal fade" id="modalValidar" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog ">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Validación SAT</h4>
						</div>

						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">
								<br />
								<div class="alert alert-success" role="alert">El proceso
									de validación de facturas ha sido terminado satisfactoriamente.</div>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning"
										href="7_justificante_detalle_disable_0.html">Aceptar</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL VALIDACION SAT -->



			<!-- MODAL ANEXO 24 -->
			<div class="modal fade" id="modalAnexo24" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">ANEXO 24</h4>
						</div>

						<div class="modal-body">
							<!--Formulario Alta Justificante-->
							<div class="bs-example">
								<br />
								<div class="alert alert-success" role="alert">El archivo
									XML del anexo 24 ha sido creado satisfactoriamente.</div>
								<br />
								<p class="text-center">
									<a type="button" class="btn btn-warning"
										href="7_justificante_detalle_disable_0.html">Aceptar</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL ANEXO 24 -->


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
	</script>
</body>
</html>
