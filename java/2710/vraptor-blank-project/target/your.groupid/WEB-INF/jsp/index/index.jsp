<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VRaptor Blank Project</title>
</head>
<body>
	It works!! ${variable} ${linkTo[IndexController].index}
        
        <a href="${pageContext.request.contextPath}/arquivo/listar">
            Listar Arquivos
        </a>
            
            
        <form action="${pageContext.request.contextPath}/index/login" method="post">
            Login: <input type="text" name="administrador.login">
            Senha: <input type="password" name="administrador.senha">
            
            <input type="submit">
        
        </form>
            
                    <a href="${pageContext.request.contextPath}/index/destruir">Destruir sessao</a>

</body>
</html>