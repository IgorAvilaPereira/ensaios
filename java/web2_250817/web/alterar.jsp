<%-- 
    Document   : excluir
    Created on : 11/08/2017, 21:16:28
    Author     : iapereira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:useBean id="usuarioDAO" class="persistencia.UsuarioDAO"></jsp:useBean>

        <jsp:useBean id="usuario" class="modelo.Usuario"></jsp:useBean>

        <jsp:setProperty name="usuario" property="*"></jsp:setProperty>


        <c:choose>
            <c:when test="${usuarioDAO.alterar(usuario) eq true}">
                <jsp:forward page="listar.jsp"></jsp:forward>            
            </c:when>        
            <c:otherwise>
                <c:out value="Xabum"></c:out>
            </c:otherwise> 
        </c:choose>
    </body>
</html>
