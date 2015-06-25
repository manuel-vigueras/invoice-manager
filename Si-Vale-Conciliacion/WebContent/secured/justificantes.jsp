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

					<div class="row">
						<div class="col-md-8">
							<h4>Justificantes de Gastos</h4>
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
										<div class="col-md-9">
											<!-- Disable
                          <h3 class="panel-title">Detalle justificantes</h3>
                           -->
										</div>
										<!-- End of Table Header Left -->

										<!-- Table Header Left -->
										<div class="col-md-3">
											<a type="button" class="btn btn-default btn-sm"
												href="adm_6_5_justificante_nuevo_0.html"> <span
												class="glyphicon glyphicon-plus" aria-hidden="true">
													Agregar Justificante</span>
											</a>

										</div>
										<!-- End of Table Header Left -->

									</div>

								</div>

								<div class="panel-body">

									<div class="table-responsive">

										<table class="table table-striped">
											<thead>
												<tr>
													<th style="width: 80px;">Fecha</th>
													<th style="width: 30px;"></th>
													<th style="width: 120px;"></th>
													<th style="width: 150px;">Nombre</th>
													<th>Descripción</th>
													<th style="width: 130px;">Estatus</th>
													<th style="width: 50px;">Detalle</th>
													<th style="width: 50px;">Acción</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><p>02/03/2015</p></td>
													<td><p>al</p></td>
													<td><p>04/03/2015</p></td>
													<td>PACHUCA</td>
													<td>Visita a planta de Pachuca</td>
													<td><span class="label label-success" href="#">Aprobado</span></td>
													<td><a
														href="adm_7_justificante_detalle_aprobado_0.html">Ver</a></td>
													<td><a type="button"
														class="btn btn-default btn-xs pull-right"
														href="adm_6_5_justificante_nuevo_0.html"> <span
															class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													</a></td>
												</tr>
												<tr>
													<td><p>05/03/2015</p></td>
													<td><p>al</p></td>
													<td><p>08/03/2015</p></td>
													<td>ACAPULCO</td>
													<td>Congreso en Acapulco 2015</td>
													<td><span class="label label-danger">Rechazado</span></td>
													<td><a
														href="adm_7_justificante_detalle_rechazado_0.html">Ver</a></td>
													<td><a type="button"
														class="btn btn-default btn-xs pull-right"
														href="adm_6_5_justificante_nuevo_0.html"> <span
															class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													</a></td>
												</tr>
												<tr>
													<td><p>15/04/2015</p></td>
													<td><p>al</p></td>
													<td><p>20/04/2015</p></td>
													<td>CALIFORNIA</td>
													<td>Visita a oficinas USA</td>
													<td><span class="label label-info" href="#">Pendiente</span></td>
													<td><a
														href="adm_7_justificante_detalle_pendiente_0.html">Ver</a></td>
													<td><a type="button"
														class="btn btn-default btn-xs pull-right"
														href="adm_6_5_justificante_nuevo_0.html"> <span
															class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													</a></td>
												</tr>
												<tr>
													<td><p>25/04/2015</p></td>
													<td><p>al</p></td>
													<td><p>30/04/2015</p></td>
													<td>MONTERREY</td>
													<td>Visita a planta de Monterrey</td>
													<td><span class="label label-info" href="#">Pendiente</span></td>
													<td><a href="adm_7_justificante_detalle_0.html">Ver</a></td>
													<td><a type="button"
														class="btn btn-default btn-xs pull-right"
														href="adm_6_5_justificante_nuevo_0.html"> <span
															class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													</a></td>
												</tr>
											</tbody>
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





			<!-- MODAL USUARIOS DE JUSTIFICANTE -->
			<div class="modal fade" id="modalUsuarios" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Viaje a Monterrey</h4>
						</div>
						<div class="modal-body">

							<!--Facturas sugeridas -->
							<table class="table">
								<thead>
									<tr>
										<th style="width: 120px;" class="text-right"></th>
										<th style="width: 80px;" class="text-right">Presupuesto</th>
										<th style="width: 80px;" class="text-right">Comprobado</th>
										<th style="width: 80px;" class="text-right">Gastado</th>
									</tr>
								</thead>
								<tbody>
									<tr style="height: 95px;">
										<td><p class="text-left head4">Total</p></td>
										<td><p style="vertical-align: text-bottom;"
												class="text-right blue" id="monto_S01">$ 345.00</p></td>
										<td><p class="text-right green" id="monto_S01">$
												345.00</p></td>
										<td><p class="text-right red" id="monto_S01">$ 345.00</p></td>
									</tr>
									<tr style="height: 75px;">
										<td><a class="userName"
											href="adm_7_justificante_detalle_0.html">David Gutiérrez</a>
											<p>8765 4563 5567 5678</p></td>
										<td><p class="text-right blue" id="monto_S01">$
												345.00</p></td>
										<td><p class="text-right red" id="monto_S01">$ 345.00</p></td>
										<td><p class="text-right green" id="monto_S01">$
												345.00</p></td>
									</tr>
									<tr style="height: 75px;">
										<td><a class="userName"
											href="adm_7_justificante_detalle_0.html">Mariana Cantú</a>
											<p>8765 4563 5567 5678</p></td>
										<td><p class="text-right red" id="monto_S01">$ 345.00</p></td>
										<td><p class="text-right blue" id="monto_S01">$
												345.00</p></td>
										<td><p class="text-right green" id="monto_S01">$
												345.00</p></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--TERMINA MODAL USUARIOS DE JUSTIFICANTE -->




			<!-- ==================================================
                    MODAL VIEWS
    ================================================== -->











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
	<script>
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
</body>
</html>
