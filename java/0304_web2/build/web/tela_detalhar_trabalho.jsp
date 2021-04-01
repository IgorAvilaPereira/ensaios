<%-- 
    Document   : tela_detalhar_trabalho
    Created on : 03/04/2018, 19:58:40
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
        <h2>Detalhamento - Trabalho</h2>
        <br>
        ${trabalho.nome}
        <h3>Pessoas Envolvidas:</h3>
        <ul>
            <c:forEach items="${trabalho.funcionarios}" var="pessoa">
                <li>
                    <a href="./DesvincularPessoa?trabalho_id=${trabalho.id}&pessoa_id=${pessoa.id}"> Desvincular </a> ${pessoa.nome}</li>

            </c:forEach>
        </ul>
    </body>
</html>
