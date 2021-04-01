<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Alterar </title>
    </head>
    <body>
        <jsp:useBean class="persistencia.UsuarioDAO" id="usuarioDAO"></jsp:useBean>                         

        <c:set var="usuario" value="${usuarioDAO.obter(Integer.parseInt(param.id))}"> </c:set>

            <form action="./alterar.jsp" method="post">
                Nome: <input type="text" name="nome" value="${usuario.nome}">
            <br>
            Email: <input type="email" name="email" value="${usuario.email}" required>
            <br>
            Preferencias:  <br>            
            <c:choose>                
                <c:when test="${usuario.preferencia eq 'F'.charAt(0)}">
                    <input type="radio" name="preferencia" value="F" checked> Futebol
                    <input type="radio" name="preferencia" value="M"> Musica
                    <input type="radio" name="preferencia" value="P"> Politica
                </c:when>
                <c:when test="${usuario.preferencia eq 'M'.charAt(0)}">
                    <input type="radio" name="preferencia" value="F" > Futebol
                    <input type="radio" name="preferencia" value="M" checked> Musica
                    <input type="radio" name="preferencia" value="P"> Politica
                </c:when>

                <c:when test="${usuario.preferencia eq 'P'.charAt(0)}">
                    <input type="radio" name="preferencia" value="F" > Futebol
                    <input type="radio" name="preferencia" value="M" > Musica
                    <input type="radio" name="preferencia" value="P" checked> Politica
                </c:when>
                <c:otherwise>
                    <input type="radio" name="preferencia" value="F" > Futebol
                    <input type="radio" name="preferencia" value="M" > Musica
                    <input type="radio" name="preferencia" value="P"> Politica

                </c:otherwise>
            </c:choose>
            <input type="hidden" name="id" value="${usuario.id}">
            <input type="submit">
        </form>
    </body>
</html>