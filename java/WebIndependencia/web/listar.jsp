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
        <table border ="1">
            <c:forEach items="${vetForcaArmada}" var="forca">
                <tr>
                    <td> <a href="./Servlet?controller=ForcaArmada&method=excluir&id=${forca.id}"> Excluir </a> </td>
                   <td> <a href="./Servlet?controller=ForcaArmada&method=tela_alterar&id=${forca.id}"> Alterar </a> </td>
                    <td> ${forca.nome} </td> 
                    <td> ${forca.efetivo} </td>
                </tr>

            </c:forEach>
        </table>
    </body>
</html>
