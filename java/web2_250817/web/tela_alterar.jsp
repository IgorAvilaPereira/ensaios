
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:useBean id="usuarioDAO" class="persistencia.UsuarioDAO"> </jsp:useBean>
        
        <c:set var="usuario" value="${usuarioDAO.obter(Integer.parseInt(param.id))}"></c:set>

            <form action="./alterar.jsp" method="post">
                Nome: <input type="text" name="nome" value="${usuario.nome}">
            <br>
            Email: <input type="email" name="email" value="${usuario.email}" required>
            <br>
            Preferencias:  <br>
            
            <select name="preferencia">
                <c:choose>
                    <c:when test="${usuario.preferencia eq 'M'.charAt(0)}">
                        <option value="M" selected="selected">Mulher</option>
                        <option value="H">Homem</option>
                        <option value="T">Todos</option>                 
                    </c:when>


                    <c:when test="${usuario.preferencia eq 'H'.charAt(0)}">
                        <option value="M" >Mulher</option>
                        <option value="H" selected="selected">Homem</option>
                        <option value="T">Todos</option>                 
                    </c:when>


                    <c:when test="${usuario.preferencia eq 'T'.charAt(0)}">
                        <option value="M" >Mulher</option>
                        <option value="H" >Homem</option>
                        <option value="T" selected="selected">Todos</option>                 
                    </c:when>




                    <c:otherwise>
                        <option value="M">Mulher</option>
                        <option value="H">Homem</option>
                        <option value="T">Todos</option>                            
                    </c:otherwise>
                </c:choose>
            </select>          
            

            <input type="hidden" name="id" value="${usuario.id}">
            <input type="submit">
            
        </form>
    </body>
</html>
