<%-- 
    Document   : listar
    Created on : 11/08/2017, 20:48:43
    Author     : iapereira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
        <style>
            tr {
                background-color: red;
                color: white;
            }

        </style>
    </head>
    <body>
        <table border="1"> 
            <jsp:useBean id="usuarioDAO" class="persistencia.UsuarioDAO"> </jsp:useBean>
            <c:forEach items="${usuarioDAO.listar()}" var="usuario" >
            <tr>
                <td> <a href="./excluir.jsp?id=${usuario.id}" class="btn btn-primary"> Excluir </a> </td>
                <td> <a href="./tela_alterar.jsp?id=${usuario.id}" class="btn btn-primary"> Alterar </a> </td>
                <td>${usuario.email} </td> 
                <td>${usuario.nome}</td> 
                <td>${usuario.preferencia}</td>
            </tr>
        </c:forEach>
        </table>
    </body>
</html>
