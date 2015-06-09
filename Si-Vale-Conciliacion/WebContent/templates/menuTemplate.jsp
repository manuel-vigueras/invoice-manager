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
<title>Resumen | Si Vale</title>
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

body .modal-sm {
	/* new custom width */
	width: 30%;
	/* must be half of the width, minus scrollbar on the left (30px) */
	/* margin-left:-375px; */
	margin-left: 35%;
}

.axis path, .axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}

.bar {
	fill: orange;
}

.bar:hover {
	fill: orangered;
}

.x.axis path {
	display: none;
}

.d3-tip {
	line-height: 1;
	font-weight: bold;
	padding: 12px;
	background: rgba(0, 0, 0, 0.8);
	color: #fff;
	border-radius: 2px;
}

.d3-tip:after {
	box-sizing: border-box;
	display: inline;
	font-size: 10px;
	width: 100%;
	line-height: 1;
	color: rgba(0, 0, 0, 0.8);
	content: "\25BC";
	position: absolute;
	text-align: center;
}

.d3-tip.n:after {
	margin: -1px 0 0 0;
	top: 100%;
	left: 0;
}
</style>

<script src="js/si-vale.js"></script>
</head>


<!-- Body starts here -->
<body>
	<div class="row">
		<div class="col-md-8">
			<span class="pull-right">
				<div class="navbar">
					<ul class="nav navbar-nav navbar-default">

						<li class="active"><a href="<s:url action="resumenAction"/>">Resumen<span
								class="sr-only">(current)</span></a></li>
						<li><a href="<s:url action="transaccionesAction"/>"
							class="btn-sm">Movimientos</a></li>
						<li><a href="<s:url action="justificantesAction"/>"
							class="btn-sm">Justificantes</a></li>
						<li><a href="<s:url action="reportesAction"/>" class="btn-sm">Reportes</a></li>
						<li><a href="<s:url action="satAction"/>" class="btn-sm">SAT</a></li>
						<li><a href="<s:url action="configuracionAction"/>"
							class="btn-sm">Configuración</a></li>
					</ul>
				</div>
			</span>
		</div>
	</div>
</body>
</html>

