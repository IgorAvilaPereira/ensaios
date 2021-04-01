<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="garota" class="modelo.Garota"></jsp:useBean>
        <jsp:setProperty property="*" name="garota"></jsp:setProperty>
        <jsp:useBean id="dao" class="persistencia.GarotaDAO"></jsp:useBean>
        <c:out value="${dao.alterar(garota)}"></c:out>
        <a href ="./index.jsp"> Voltar </a>    </body>
</html>
