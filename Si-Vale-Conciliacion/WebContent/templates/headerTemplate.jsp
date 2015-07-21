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
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>
<link href="css/template_header.css" rel="stylesheet">

</head>


<body>

	<s:form action="logout">

		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="welcome.jsp"> <img alt="Brand"
						src="img/logo-nav.png">
					</a>
				</div>
				<div class="collapse navbar-collapse navbar-right">

<%-- 					<ul class="nav navbar-nav">
						<li><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fa fa-bell"></i> <b
								class="caret"></b></a>
							<ul class="dropdown-menu alert-dropdown">
								<li><a href="#">Alert Name <span
										class="label label-default">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-primary">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-success">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-info">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-warning">Alert Badge</span></a></li>
								<li><a href="#">Alert Name <span
										class="label label-danger">Alert Badge</span></a></li>
								<li class="divider"></li>
								<li><a href="#">View All</a></li>
							</ul></li>

					</ul> --%>

					<ul class="nav navbar-nav">
						<li><a class="dropdown-toggle"><i
								class="fa fa-credit-card"></i> ${sessionScope.noTarjeta} </a></li>
					</ul>


					<ul class="nav navbar-nav">
						<li><a class="dropdown-toggle"><i class="fa fa-user"></i>
								${sessionScope.userName} </a></li>
					</ul>



					<ul class="nav navbar-nav">
						<li><s:a href="logout.action">
								<i class="fa fa-sign-in"></i> Salir</s:a></li>
					</ul>
				</div>
			</div>
		</div>
	</s:form>

</body>
</html>
