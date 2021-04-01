<%-- 
    Document   : tela_alterar
    Created on : 08/03/2017, 20:34:03
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
        <jsp:useBean id="garota" class="modelo.Garota"></jsp:useBean>
        <jsp:useBean id="dao" class="persistencia.GarotaDAO"></jsp:useBean>
        
        <jsp:setProperty property="apelido" name="garota" value="${dao.obter(param.id).apelido}"></jsp:setProperty>
        <jsp:setProperty property="bumbum" name="garota" value="${dao.obter(param.id).bumbum}"></jsp:setProperty>
        <jsp:setProperty property="valorPorHora" name="garota" value="${dao.obter(param.id).valorPorHora}"></jsp:setProperty>
        <jsp:setProperty property="altura" name="garota" value="${dao.obter(param.id).altura}"></jsp:setProperty>
        <jsp:setProperty property="id" name="garota" value="${param.id}"></jsp:setProperty>
                        
        <form action="./alterar.jsp" method="post">
            Apelido: <input type="text" name="apelido" value="${garota.apelido}"> 
            <br>
            Bumbum: <input type="text" name="bumbum" value="${garota.bumbum}"> 
            <br>
            Altura: <input type="text" name="altura" value="${garota.altura}"> 
            <br>
            Valor: <input type="text" name="valorPorHora" value="${garota.valorPorHora}"> 
            <br>
            <input type="hidden" name="id" value="${garota.id}">            
            <input type="submit" value="Alterar">           
        </form>
    </body>
</html>
