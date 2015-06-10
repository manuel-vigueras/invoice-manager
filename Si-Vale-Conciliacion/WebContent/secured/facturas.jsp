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
<title>Facturas | Si Vale</title>
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


<!-- Body starts here -->
<body data-ng-app="myApp">


	<!-- Wrap all page content here -->
	<div id="wrap" data-ng-controller="facturasController">

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
						<div class="col-md-8" data-ng-controller="getUsuarios">
							<h4>Facturas Pendientes</h4>
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenuPeriodo" data-toggle="dropdown"
								aria-expanded="true">
								Filtro Usuarios <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">Promedios Globales (todos los usuarios)</a></li>
								<li role="presentation" data-ng-repeat="usr in usuarios"><a
									role="menuitem" tabindex="-1"
									data-ng-click="filterFacturasByUser(usr.nombre)">{{usr.idUser}}
										- {{usr.nombre}}</a></li>
							</ul>
						</div>

						<div class="col-md-4">
							<span class="pull-right">
								<ul class="nav nav-pills">
									<li><a href="<s:url action="transaccionesAction"/>">Ver
											Transacciones</a></li>
								</ul>
							</span>
						</div>
					</div>

					<br />

					<!-- Grid for Table content -->
					<div class="row" data-ng-controller="getAllFacturas">
						<div class="col-md-12">

							<!-- Data Table Panel-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">Detalle facturas</h3>
								</div>

								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped">
											<tr>
												<th style="width: 120px;">Usuario</th>
												<th style="width: 100px;">Tarjeta</th>
												<th style="width: 100px;">Folio</th>
												<th style="width: 150px;">Fecha</th>
												<th>RFC Emisor</th>
												<th style="width: 100px;">Archivo</th>
												<th style="width: 120px;" class="text-right">Monto</th>
											</tr>
											<tr data-ng-repeat="factura in facturas">
												<td>{{factura.usuario}}</td>
												<td>{{factura.tarjeta}}</td>
												<td>{{factura.folio}}</td>
												<td>{{factura.fecha}}</td>
												<td>{{factura.rfcEmisor}}</td>
												<td><a href="#"> <img src="img/xml.png" alt="XML"
														style="width: 20px; height: 20px">
												</a> <a href="#"> <img src="img/pdf.png" alt="pdf"
														style="width: 20px; height: 20px">
												</a></td>
												<td><p class="text-right">$ {{factura.monto}}</p></td>
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
	<script>
		var d = new Date();
		document.getElementById("date").innerHTML = d.toDateString();
	</script>
</body>
</html>
