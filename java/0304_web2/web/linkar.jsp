

<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2> Pessoas </h2>
        <form action="./LinkarTrabPessoaServlet" method="post">
            Pessoas:
            <select name="pessoa_id">
                <c:forEach items="${vetPessoa}" var="pessoa">
                    <option value="${pessoa.id}">  ${pessoa.nome}</option>
                    </c:forEach>
            </select>
            <input type="hidden" value="${trabalho_id}" name="trabalho_id">
            <input type="submit">
        </form>
    </body>

</html>