<%-- 
    Document   : tela_adicionar
    Created on : 08/09/2017, 20:07:13
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
            Nome: <input type="text" name="nome">
            
            <br>
            
            Efetivo <input type="number" name="efetivo">
            
            <br>
            
            Bairro: <input type="text" name="bairro">
            <!-- colocar os demais...-->
            
            <input name="controller" type="hidden" value="ForcaArmada">
            <input name="method" type="hidden" value="adicionar">
            <input type="submit">
            
        </form>
    </body>
</html>
