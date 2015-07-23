<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Inicio | Si Vale</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--<link href="css/styles.css" rel="stylesheet">-->

</head>


<body>

	<div id="wrap">
		<jsp:include page="../templates/headerTemplate.jsp"/>


		<div class="container-fluid">
			<div class="row">
				<jsp:include page="../templates/menuTemplate.jsp"/>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h2 class="page-header">Resumen de cuenta</h2>
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>