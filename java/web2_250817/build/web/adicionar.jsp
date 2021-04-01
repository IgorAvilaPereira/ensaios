<%-- 
    Document   : adicionar
    Created on : 11/08/2017, 20:20:24
    Author     : iapereira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="usuario" class="modelo.Usuario"> </jsp:useBean>
        
        <jsp:setProperty name="usuario" property="*"></jsp:setProperty>
        
        <jsp:useBean id="usuarioDAO" class="persistencia.UsuarioDAO"></jsp:useBean>
        
    <c:choose>
        <c:when test="${usuarioDAO.adicionar(usuario) eq true}">
            <jsp:forward page="listar.jsp"></jsp:forward>
        </c:when>        
        <c:otherwise>
            <c:out value="Xabum" /> 
            
        </c:otherwise>
    </c:choose>
        
       
    </body>
</html>
