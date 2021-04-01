<%-- 
    Document   : tela_alterar
    Created on : 22/03/2017, 21:09:55
    Author     : iapereira
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tela Alterar - Garota</h1>
        <form action="./Servlet" method="post">            
            Apelido: <input type="text" name="apelido" value="${garota.apelido}"> <br>
            Altura (cm): <input type="text"  name="altura" value="${garota.altura}"> <br>
            Bumbum (cm): <input type="text" name="bumbum" value="${garota.bumbum}"> <br>
            Valor/Hora (R$):<input type="text" name="valor" value="${garota.valor}">  <br>   
            
            <select name="sauna_id">
                <c:forEach items="${vetSauna}" var="sauna">
                    <c:choose>
                        <c:when test="${garota.saunaId.id == sauna.id}">
                            <option value="${sauna.id}" selected> ${sauna.nome} </option>
                        </c:when>    
                        <c:otherwise>
                            <option value="${sauna.id}"> ${sauna.nome} </option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>

            <!-- parametros hidden -->
            <input type="hidden" value="${garota.id}" name="id">        
            <input type="hidden" name="controller" value="Garota">
            <input type="hidden" name="method" value="alterar">
            <input type="submit">
        </form>
    </body>
</html>
