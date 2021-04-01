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
            Nome: <input type="text" name="nome" value="${forca.nome}">
            <br>
            
            Efetivo <input type="number" name="efetivo" value="${forca.efetivo}">
            <input name="controller" type="hidden" value="ForcaArmada">
            <input name="method" type="hidden" value="alterar">
            <input name="id" type="hidden" value="${forca.id}">
            <input type="submit">
            
        </form>
    </body>
</html>
