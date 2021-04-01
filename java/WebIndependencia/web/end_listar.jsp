<%-- 
    Document   : listar
    Created on : 08/09/2017, 20:27:53
    Author     : iapereira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listagem de Enderecos....</h1>
        <table border ="1">
            <c:forEach items="${vetEndereco}" var="endereco">
                <tr>
                    <td> <a href="./Servlet?controller=Endereco&method=excluir&id=${endereco.id}"> Excluir </a> </td> 
                    <td> ${endereco.bairro} </td> 
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
