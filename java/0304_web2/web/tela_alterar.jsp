<%-- 
    Document   : adicionar
    Created on : 27/02/2018, 19:49:36
    Author     : iapereira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> WEB2</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>      
    </head>
    <body>    

        <div class="form-group" style="position: relative; float:left;">


            <fieldset style="width: 200px;">
                <legend> Tela Alterar </legend>	
                <form action="./AlterarServlet" method="POST">
                    Nome: 
                    <input class="form-control" type="text" id="nome" name="nome" value="${pessoa.nome}"> <br>
                    Sexo: 
                    <c:choose>
                        <c:when test="${pessoa.sexo eq 'M'.charAt(0)}">
                            <input class="radio-inline" type="radio" name="sexo" value="M" checked="checked"> M 
                            <input class="radio-inline" type="radio" name="sexo" value="F"> F <br><br>
                        </c:when>
                        <c:otherwise>
                            <input class="radio-inline" type="radio" name="sexo" value="M"> M 
                            <input class="radio-inline" type="radio" name="sexo" value="F" checked="checked"> F <br><br>
                        </c:otherwise>                    
                    </c:choose>                
                    Preferencias: <select name="preferencias" class="form-control">
                        <c:choose>
                            <c:when test="${pessoa.preferencias eq 'sado'}">

                                <option value="sado" selected="selected">sado</option>
                                <option value="milf">milf</option>
                            </c:when>
                            <c:otherwise>
                                <option value="sado">sado</option>
                                <option value="milf" selected="selected">milf</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                    <br><br>
                    <input type="hidden" name="id" value="${pessoa.id}">
                    <input type="submit" class="btn btn-primary" value="Alterar">
                </form>
            </fieldset>
        </div>
        <a href="./ListarServlet">Listar</a>


    </body>
</html>