<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/si-vale.js"></script>
</head>


<!-- Body starts here -->
<body>
	<div class="col-sm-3 col-md-2 sidebar">
		<ul class="nav nav-sidebar">
			<li><a
				href="<s:url action="resumenAction"/>"><i class="fa fa-home"></i> Inicio					
			</a></li>
			<li><a
				href="<s:url action="transaccionesAction"/>"><i class="fa fa-money"></i> Conciliacion </a></li>
			<li><a
				href="<s:url action="justificantesAction"/>"> <i class="fa fa-file-text-o"></i> Comprobacion</a></li>
			<li><a
				href="<s:url action="reportesAction"/>"><i class="fa fa-bar-chart"></i> Reportes</a></li>
			
			<%if(request.isUserInRole("adminRole")) { %>
			<li><a
				href="<s:url action="configuracionAction"/>"><i class="fa fa-cog"></i> Configuración</a></li>
			<%} %>				
		</ul>
	</div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="js/active.js"></script>		
</body>
</html>

