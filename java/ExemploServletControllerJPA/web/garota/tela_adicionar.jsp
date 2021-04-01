<%-- 
    Document   : index
    Created on : 22/03/2017, 20:01:27
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
    <body>
        <h1>Tela Adicionar - Garota</h1>
        <form action="./Servlet?controller=Garota&method=adicionar" method="post">
            Apelido: <input type="text" name="apelido"> <br>
            Altura (cm): <input type="text"  name="altura"> <br>
            Bumbum (cm): <input type="text" name="bumbum"> <br>
            Valor/Hora (R$):<input type="text" name="valor">  <br> 
            <select name="sauna_id">
                <c:forEach items="${vetSauna}" var="sauna">
                    <option value="${sauna.id}"> ${sauna.nome} </option>
                </c:forEach>
            </select>
            <input type="submit">
        </form>
        <a href="./Servlet?controller=Garota&method=listar">Listar</a>
        
    </body>
</html>
