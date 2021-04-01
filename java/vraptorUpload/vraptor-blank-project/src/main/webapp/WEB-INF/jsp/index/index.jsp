<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VRaptor Blank Project</title>
    </head>
    <body>
        It works!! ${variable} ${linkTo[IndexController].index}

        <form action="${linkTo[IndexController].upload}" method="post" enctype="multipart/form-data">
            Arquivo: <input type="file" name="arquivo">
            <input type="submit">
        </form>
    </body>
    
    
    <h1> Exemplo Exibir </h1>
    
    <img src="${linkTo[IndexController].exibir}" width="100px" height="100px">
</html>