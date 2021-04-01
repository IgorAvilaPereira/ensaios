<%-- 
    Document   : index
    Created on : 08/03/2017, 19:47:53
    Author     : iapereira
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="./cabecalho.jsp" %>
        
        <% Calendar calendario = Calendar.getInstance(); %>
        
        <% double numero = 69.699999999; %>
        
        <fmt:formatDate var="data" pattern="dd/MM/yyyy" value="<%=calendario.getTime()%>"></fmt:formatDate>
        
        <%=numero%>
        <fmt:formatNumber type="number" pattern="###.##" value="<%=numero%>"></fmt:formatNumber>

        
        
     
        
        
        
        <form action="./excluir_multiplo.jsp" method="post">
        <table border="1">
            <tr>
                <td>  </td>
                <td> Id </td> 
                <td> Apelido</td>
                <td> Altura </td>
                <td> Bumbum </td>
                <td> Valor </td>
                <td> Excluir </td>
                <td> Alterar </td>
            </tr>       
           
            <jsp:useBean id="dao" class="persistencia.GarotaDAO"></jsp:useBean>
           
            <c:forEach var="garota" items="${dao.selecionarTodos()}">
            <tr>               
                <td> <input type="checkbox" name="id" value="${garota.id}"></td>
                <td>${garota.id} </td> 
                <td>${garota.apelido}</td>
                <td>${garota.altura}</td>
                <td>${garota.bumbum} </td>
                <td>${garota.valorPorHora} </td>
                <td> <a href="./excluir.jsp?id=${garota.id}">Excluir</a></td>
                <td> <a href="./tela_alterar.jsp?id=${garota.id}">Alterar</a></td>
            </tr>
            </c:forEach>
        </table>
        <input type="submit" value="Excluir Multiplo">
        </form>
        <br>
        <a href="./tela_adicionar.jsp">Adicionar</a>
    </body>
</html>
