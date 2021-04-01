<%-- 
    Document   : listar
    Created on : 30/03/2017, 14:16:10
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
        <h1>Sauna</h1>
        <ul>
            <c:forEach items="${vetSauna}" var="sauna">
                <li> ${sauna.nome} - <a onclick = "return confirm('Ira deletar todas as garotas?');" href="${pageContext.servletContext.contextPath}/Servlet?controller=Sauna&method=excluir&id=${sauna.id}">Excluir</a>  | <a href="${pageContext.servletContext.contextPath}/Servlet?controller=Sauna&method=tela_alterar&id=${sauna.id}">Alterar</a> </li>                       
            </c:forEach>
        </ul>
        <a href="./Servlet?controller=Sauna&method=tela_adicionar"> Adicionar </a>
    </body>
</html>
