<%-- 
    Document   : testDate
    Created on : 25/08/2017, 20:45:50
    Author     : iapereira
--%>

<%@page import="java.util.Date"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <p>Formatted Date (7): <fmt:formatDate pattern = "dd/MM/yyyy" 
         value ="<%=new Date()%>"/></p>    
    <%=new Date()%>
</body>
</html>
