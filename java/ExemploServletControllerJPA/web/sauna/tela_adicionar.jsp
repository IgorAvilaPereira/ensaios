<%-- 
    Document   : index
    Created on : 30/03/2017, 13:59:58
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
        <h1>Tela Adicionar - Sauna</h1>
        <form action="./Servlet?controller=Sauna&method=adicionar" method="post">
            Nome: <input type="text" name="nome"> 
            <input type="submit">            
        </form>
    </body>
</html>
