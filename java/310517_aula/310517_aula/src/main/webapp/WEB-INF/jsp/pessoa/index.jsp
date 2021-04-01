<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VRaptor Blank Project</title>
    </head>
    <body>
        oi...
        <ul>
            <c:forEach items="${vetPessoa}" var="pessoa">

                <li><a href="${pageContext.request.contextPath}/pessoa/excluir/${pessoa.id}">${pessoa.nome} </a></li>

            </c:forEach>
        </ul>
    </body>
</html>