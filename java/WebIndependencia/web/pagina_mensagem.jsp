<%-- 
    Document   : pagina_mensagem
    Created on : 08/09/2017, 20:25:33
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
        <h1>${mensagem}</h1>
        <a href="./tela_adicionar.jsp">Adicionar Novamente?</a>
        <a href="./Servlet?controller=ForcaArmada&method=listar"> Voltar </a>
    </body>
</html>
