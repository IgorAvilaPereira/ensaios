<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>VRaptor JPA</title>
    </head>
    <body>
        <ul>
            <c:forEach items="${vetPessoa}" var="pessoa">
                <li> ${pessoa.nome}</li>
                </c:forEach>
        </ul>
    </body>
</html>