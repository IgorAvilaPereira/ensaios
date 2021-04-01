<%-- 
    Document   : listar
    Created on : 22/03/2017, 20:27:22
    Author     : iapereira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Garota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%--
        <%
           out.println("chegou...");
           ArrayList<Garota> vetGarota = (ArrayList<Garota>) request.getAttribute("vetGarota");
           for (int idx = 0; idx < vetGarota.size(); idx++) {
                Garota garota = vetGarota.get(idx);
                out.println(garota.getAltura());
                out.println(garota.getApelido());
                out.println(garota.getBumbum());
                out.println(garota.getId());
                out.println(garota.getValorPorHora());                   
           }
         %>
        --%>

        <table border="1">
            <tr>
                <td> Apelido </td> 
                <td> Bumbum </td> 
                <td>Altura</td> 
                <td> Valor </td> 
                <td> Excluir </td>
                <td> Alterar </td>
            </tr>
            <c:forEach var="garota" items="${vetGarota}">
                <tr>
                    <td> ${garota.apelido} </td> 
                    <td> ${garota.bumbum} </td> 
                    <td> ${garota.altura}</td> 
                    <td> ${garota.valorPorHora} </td> 
                    <td> <a href="./Servlet?controller=Garota&method=excluir&id=${garota.id}"> Excluir </a></td>                    
                    <td> <a href="./Servlet?controller=Garota&method=tela_alterar&id=${garota.id}"> Alterar </a></td>                    
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
