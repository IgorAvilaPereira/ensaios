<%-- 
    Document   : tela_adicionar
    Created on : 08/03/2017, 20:03:35
    Author     : iapereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include  file="./cabecalho.jsp" %>
        <%
          
            String parametro1 = (String) session.getAttribute("parametro1");
            out.println("<h1>"+parametro1+" esta armazenado na sessao...</h1>");
            
        %>
        <form action="./adicionar.jsp" method="post">
            Apelido: <input type="text" name="apelido"> 
            <br>
            Bumbum: <input type="text" name="bumbum"> 
            <br>
            Altura: <input type="text" name="altura"> 
            <br>
            Valor: <input type="text" name="valorPorHora"> 
            <br>
            <input type="submit" value="Adicionar">           
        </form>
    </body>
</html>
