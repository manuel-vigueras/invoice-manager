<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Login | Si Vale</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="css/styles.css" rel="stylesheet">
<!-- script references -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<body>
	<!--login modal-->
	<div id="loginModal" class="modal show" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="text-center">
						<img src="img/logo.png" style="width: 205px; height: 51px"
							alt="Si Vale">
					</h1>
				</div>
				<div class="modal-body">
					<form method="post" action="j_security_check" 
					 class="form col-md-12 center-block">
						<div class="form-group">
							<input name="j_username" class="form-control input-lg" placeholder="Usuario">							

						</div>
						<div class="form-group">							
							<input name="j_password" class="form-control input-lg" 
								type="password" placeholder="Contrasena">
						</div>
						<div class="form-group">

							<input type="submit" value="Ingresar" 
								class="btn btn-primary btn-lg btn-block">

						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="col-md-12"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>