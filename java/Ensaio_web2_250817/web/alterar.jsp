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
        <jsp:useBean class="modelo.Usuario" id="usuario"></jsp:useBean>     
        <jsp:setProperty name="usuario" property="nome" value="${param.nome}"></jsp:setProperty>
        <jsp:setProperty name="usuario" property="email" value="${param.email}"></jsp:setProperty>
        <jsp:setProperty name="usuario" property="preferencia" value="${param.preferencia}"></jsp:setProperty>
        <jsp:setProperty name="usuario" property="id" value="${Integer.parseInt(param.id)}"></jsp:setProperty>
        <jsp:useBean class="persistencia.UsuarioDAO" id="usuarioDAO"></jsp:useBean>     
        <c:choose>
            <c:when test="${usuarioDAO.alterar(usuario) eq true}"> 
            Alterado            
        </c:when>       
            <c:otherwise>
                Xabum...
            </c:otherwise>
    </c:choose>
    <a href="./index.jsp">Listar</a>
</body>
</html>
