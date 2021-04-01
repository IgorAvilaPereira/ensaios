<%-- 
    Document   : tela_adicionar
    Created on : 27/10/2017, 21:23:43
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
        <form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/arquivo/upload">
            Arquivo: <input type="file" name="arquivo" >
            <input type="submit">
        </form>
    </body>
</html>
