<%@ page session="true"%>

'<%=request.getSession().getAttribute("userr") %>' Ha terminado la sesion. 

<% session.invalidate(); %>

<br/><br/>
<a href="login.jsp">Click aqui para regresar a la pagina de inicio</a>