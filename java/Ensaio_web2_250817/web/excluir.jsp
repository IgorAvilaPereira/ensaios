<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean class="persistencia.UsuarioDAO" id="usuarioDAO"></jsp:useBean>     
        <c:choose>
            <c:when test="${usuarioDAO.excluir(Integer.parseInt(param.id)) eq true}"> 
                Excluido
                <jsp:forward page="index.jsp"></jsp:forward>
            </c:when>
            <c:otherwise>
                Deu xabum
            </c:otherwise>   
        </c:choose>        
        <a href="./index.jsp">Listar</a>
    </body>
</html>