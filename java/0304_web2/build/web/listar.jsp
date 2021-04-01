

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
        <ul>
            <c:forEach items="${vetPessoa}" var="pessoa">
                <li>
                    <a href="./TelaAdicionarDependenteServlet?id=${pessoa.id}"> Adicionar Dep. </a> 
                    <a href="./ExcluirServlet?id=${pessoa.id}"> Excluir </a> 
                    <a href="./TelaAlterarServlet?id=${pessoa.id}"> Alterar </a> 
                    ${pessoa.nome}</li>
                </c:forEach>
        </ul>

        <h2> Trabalhos </h2>
        <ul>
            <c:forEach items="${vetTrabalho}" var="trabalho">
                <li>
                    <a href="./TelaLinkarTrabPessoaServlet?trabalho_id=${trabalho.id}"> Linkar </a> 
                    <a href="./TelaDetalharTrabalho?trabalho_id=${trabalho.id}"> Detalhar </a> 


                    ${trabalho.nome}</li>
                </c:forEach>
        </ul>

        <%
            Calendar calendario = Calendar.getInstance();
        %>

        <fmt:formatDate value="<%=calendario.getTime()%>" pattern="dd/MM/yyyy H:mm:ss" />
    </body>
</html>
