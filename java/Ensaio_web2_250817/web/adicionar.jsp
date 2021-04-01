<%-- 
    Document   : adicionar
    Created on : 11/08/2017, 20:20:24
    Author     : iapereira
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body>
        <jsp:useBean class="persistencia.UsuarioDAO" id="usuarioDAO"></jsp:useBean>     
        <jsp:useBean class="modelo.Usuario" id="usuario"></jsp:useBean>     
        <jsp:setProperty name="usuario" property="nome" value="${param.nome}"></jsp:setProperty>
        <jsp:setProperty name="usuario" property="email" value="${param.email}"></jsp:setProperty>
        <jsp:setProperty name="usuario" property="preferencia" value="${param.preferencia}"></jsp:setProperty>                       
        <c:choose>
            <c:when test="${usuarioDAO.adicionar(usuario) eq true}"> 
            Adicionado
            </c:when>
            <c:otherwise>
                Deu xabum
            </c:otherwise>   
        </c:choose>
        <a href="./index.jsp">Listar</a>
    </body>
</html>