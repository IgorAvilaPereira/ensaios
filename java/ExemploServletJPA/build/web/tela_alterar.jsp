<%-- 
    Document   : tela_alterar
    Created on : 22/03/2017, 21:09:55
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
        <form action="./Servlet" method="post">
            Apelido: <input type="text" name="apelido" value="${garota.apelido}"> <br>
            Altura (cm): <input type="text"  name="altura" value="${garota.altura}"> <br>
            Bumbum (cm): <input type="text" name="bumbum" value="${garota.bumbum}"> <br>
            Valor/Hora (R$):<input type="text" name="valorPorHora" value="${garota.valorPorHora}">  <br>           
            <input type="hidden" value="${garota.id}" name="id">
            <input type="hidden" name="controller" value="Garota">
            <input type="hidden" name="method" value="alterar">
            <input type="submit">
        </form>
    </body>
</html>
