<%-- 
    Document   : listar
    Created on : 27/10/2017, 20:13:49
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
        <h1>Listar Arquivos</h1>
        ${zamberlan}
        <table> 
            <c:forEach var="arquivo" items="${vetArquivo}">
                <tr> <td> <a href="${pageContext.request.contextPath}/arquivo/excluir/${arquivo.name}"> Excluir </a> </td> <td> <img height="100px" width="100px" src="${pageContext.request.contextPath}/arquivo/visualizar/${arquivo.name}"> </td> </tr>
                    </c:forEach>
        </table>



        <a href="${pageContext.request.contextPath}/arquivo/tela_adicionar">Adicionar</a>

    </body>
</html>
