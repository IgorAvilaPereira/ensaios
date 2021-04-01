<%-- 
    Document   : adicionar
    Created on : 08/03/2017, 20:06:40
    Author     : iapereira
--%>

<%@page import="persistencia.GarotaDAO"%>
<%@page import="modelo.Garota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Garota garota = new Garota(); -->
        <jsp:useBean id="garota" class="modelo.Garota"></jsp:useBean>
            <!--
            garota.setApelido(request.getParameter("apelido"));
            garota.setBumbum(Double.valueOf(request.getParameter("bumbum")));
            garota.setAltura(Double.valueOf(request.getParameter("altura")));
            garota.setValorPorHora(Double.valueOf(request.getParameter("valor")));        
            -->

        <jsp:setProperty property="*" name="garota"></jsp:setProperty>

        <jsp:useBean id="dao" class="persistencia.GarotaDAO"></jsp:useBean>
        
        ${dao.adicionar(garota)}
        
        <a href ="./index.jsp"> Voltar </a>
    </body>
</html>
