<%-- 
    Document   : excluir
    Created on : 08/03/2017, 20:19:08
    Author     : iapereira
--%>

<%@page import="persistencia.GarotaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="dao" class="persistencia.GarotaDAO"></jsp:useBean>                        
        ${dao.excluir(param.id)}       
    </body>
</html>
