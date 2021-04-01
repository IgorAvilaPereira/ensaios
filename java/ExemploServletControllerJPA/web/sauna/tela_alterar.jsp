<%-- 
    Document   : tela_alterar
    Created on : 05/04/2017, 14:42:31
    Author     : iapereira
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tela Alterar - Sauna</h1>
        <form action="./Servlet" method="post">
            
            Nome: <input type="text" name="nome" value="${sauna.nome}"> <br>
            
            <!-- parametros hidden -->
            <input type="hidden" name="id" value="${sauna.id}">            
            <input type="hidden" name="controller" value="Sauna">
            <input type="hidden" name="method" value="alterar">
            
            <input type="submit">
        </form>
    </body>
</html>