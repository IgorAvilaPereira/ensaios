<%-- 
    Document   : recebeGet
    Created on : 22/11/2016, 20:21:28
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
        Recebido por GET: <%=request.getParameter("parametro")%>
        <%@include file="rodape.jsp" %>
    </body>
</html>
