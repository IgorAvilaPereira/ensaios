<%-- 
    Document   : testeErro
    Created on : 15/03/2017, 00:43:31
    Author     : iapereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="erro.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        out.println(1/0);
      %>
</html>
