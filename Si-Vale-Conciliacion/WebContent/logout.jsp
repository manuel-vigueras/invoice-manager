<%@ page session="true"%>

'<%=request.getRemoteUser()%>' Ha terminado la sesion. 

<% session.invalidate(); %>

<br/><br/>
<a href="login.jsp">Click aqui para regresar a la pagina de inicio</a>