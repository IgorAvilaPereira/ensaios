<%-- 
    Document   : tela_adicionar_dependente
    Created on : 27/03/2018, 20:42:19
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
        <form action="./AdicionarDependente" method="post">
            Nome: <input type="text" name="nome">           
            
            <input type="hidden" name="pessoa_id" value="${pessoa_id}">
            
            <input type="submit">
        </form>
    </body>
</html>
