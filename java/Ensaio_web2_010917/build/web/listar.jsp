<%-- 
    Document   : listar
    Created on : 23/08/2017, 14:54:36
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
        <h1>Hello World!</h1>
        
          <c:forEach items="${vet}" var="usuario">
            <tr>
                <td> <a href="./usuarios?rota=excluir&id=${usuario.id}"> Excluir </a> </td>
                <td> <a href="./tela_alterar.jsp?id=${usuario.id}"> Alterar </a> </td>
                <td>${usuario.email} </td> 
                <td>${usuario.nome} </td> 
                <td>${usuario.preferencia}</td>
            </tr>
            </c:forEach>
    </body>
</html>
