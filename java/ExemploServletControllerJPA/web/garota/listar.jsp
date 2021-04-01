<%-- 
    Document   : listar
    Created on : 05/04/2017, 14:35:23
    Author     : iapereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Garotas</h1>
         <ul>
            <c:forEach items="${vetGarota}" var="garota">
                <li> ${garota.apelido} - <a href="${pageContext.servletContext.contextPath}/Servlet?controller=Garota&method=excluir&id=${garota.id}">Excluir</a>| <a href="${pageContext.servletContext.contextPath}/Servlet?controller=Garota&method=tela_alterar&id=${garota.id}">Alterar</a> </li>                       
            </c:forEach>
        </ul>
        <a href="./Servlet?controller=Garota&method=tela_adicionar"> Adicionar </a>
        <br> <br>
        <a href="./Servlet?controller=Sauna&method=listar"> Listar Sauna </a>
    </body>
</html>
