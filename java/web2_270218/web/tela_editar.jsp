<%@page import="persistencia.PessoaDAO"%>
<%@page import="modelo.Pessoa"%>
<!DOCTYPE html>
<html>
    <head>
        <title> TINDER WEB2</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    </head>
    <% Pessoa pessoa = new PessoaDAO().carregar(Integer.parseInt(request.getParameter("id")));%>
    <body>
        <jsp:include page="cabecalho.jsp"></jsp:include>
    <hr>
    <div class="form-group" style="position: relative; float:left;">
        <fieldset style="width: 200px;">
            <legend> Tela Editar </legend>	
            <form action="./editar.jsp" method="POST">
                Nome: 
                <input class="form-control" type="text" id="nome" name="nome" value="<%=pessoa.getNome()%>"> <br>
                Sexo: 
                <input class="radio-inline" type="radio" name="sexo" value="M" <%=((pessoa.getSexo() == 'M') ? "checked" : "")%>> M 
                <input class="radio-inline" type="radio" name="sexo" value="F" <%=((pessoa.getSexo() == 'F') ? "checked" : "")%>> F <br><br>

                Preferencias: <select name="preferencias" class="form-control">
                    <option value="sado" <%=((pessoa.getPreferencias().equals("sado")) ? "selected" : "")%>>sado</option>
                    <option value="milf" <%=((pessoa.getPreferencias().equals("milf")) ? "selected" : "")%>>milf</option>
                </select>
                <br><br>
                <input type="hidden" name="id" value="<%=pessoa.getId()%>">
                <input type="submit" class="btn btn-primary" value="Cadastrar">
            </form>
        </fieldset>
    </div>
    <a href="./listar.jsp">Listar</a>


</body>
</html>