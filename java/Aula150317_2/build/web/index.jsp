<%-- 
    Document   : index
    Created on : 15/03/2017, 17:14:33
    Author     : iapereira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <h1>Hello World!</h1>
    
    <jsp:useBean id="pessoa" class="modelo.Pessoa"></jsp:useBean>
    <jsp:useBean id="agenda" class="modelo.Agenda"></jsp:useBean>    
    
    <jsp:setProperty name="pessoa" property="nome" value="Igor"></jsp:setProperty>    
    <jsp:getProperty name="pessoa" property="nome"></jsp:getProperty>
    
    <c:forEach var="x" items="${agenda.vetPessoa}">
        ${x.nome}     
    </c:forEach>
</html>
