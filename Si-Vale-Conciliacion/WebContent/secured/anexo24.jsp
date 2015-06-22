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

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>

</head>

</head>


<!-- Body starts here -->
<body data-ng-app="myApp">

	<!-- Wrap all page content here -->
	<div id="wrap">

		<jsp:include page="../templates/headerTemplate.jsp" />


		<!-- MAIN CONTAINER 
    =========================================== -->
		<div class="container container-xs" data-ng-controller="satController">

			<!-- Grid for Panel and Banner -->
			<div class="row">

				<!-- Col for Panel -->
				<div class="col-md-10">

					<jsp:include page="../templates/menuTemplate.jsp" />

					<!-- ROW de botones -->
					<div class="row">
						<div class="col-md-9">
							<h4>Facturas vinculadas.</h4>
							Periodo:
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenuPeriodo" data-toggle="dropdown"
								aria-expanded="true">
								Actual<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-ng-click="filterFacturasVinculadasByPeriodo('mesAnterior')">Mes
										anterior</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-ng-click="filterFacturasVinculadasByPeriodo('dosAnterior')">Dos
										meses atras</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									data-ng-click="filterFacturasVinculadasByPeriodo('tresAnterior')">Tres
										meses atras</a></li>
							</ul>
						</div>

						<div class="col-md-3">
							<div class="btn-group-vertical pull-right" role="group"
								aria-label="...">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#modalValidar">
									<span class="glyphicon glyphicon-check" aria-hidden="true"></span>
									Validar
								</button>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#modalAnexo24">
									<span class="glyphicon glyphicon-open-file" aria-hidden="true"></span>
									Generar Anexo
								</button>
							</div>
						</div>
					</div>
					<!-- TERMINA ROW de botones -->

					<br />

					<!-- Grid for Table content -->
					<div class="row">
						<div class="col-md-12">



							<!-- Data Table Panel-->
							<div class="panel panel-default"
								data-ng-controller="getAllFacturasVinculadas">
								<div class="panel-heading">
									<h3 class="panel-title">Detalle facturas</h3>
								</div>

								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped">
											<tr>
												<th style="width: 120px;">Usuario</th>
												<th style="width: 100px;">Tarjeta</th>
												<th style="width: 80px;">Folio</th>
												<th style="width: 100px;">Fecha</th>
												<th>RFC Emisor</th>
												<th class="text-right" style="width: 100px;">Monto</th>
												<th style="width: 120px;">Validación SAT</th>
											</tr>
											<tr data-ng-repeat="factura in facturas">
												<td>{{factura.usuario}}</td>
												<td>{{factura.tarjeta}}</td>
												<td>{{factura.folio}}</td>
												<td>{{factura.fecha}}</td>
												<td>{{factura.rfcEmisor}}</td>
												<td><p class="text-right">$ {{factura.monto}}</p></td>
												<td><span class="label label-success">{{factura.estatusSat}}</span></td>
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
