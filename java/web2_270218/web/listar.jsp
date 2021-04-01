<%-- 
    Document   : listar
    Created on : 27/02/2018, 20:08:49
    Author     : iapereira
--%>

<%@page import="persistencia.PessoaDAO"%>
<%@page import="modelo.Pessoa"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <title> TINDER WEB2</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            ArrayList<Pessoa> vetPessoa = new PessoaDAO().listar();
        %>
        <jsp:include page="cabecalho.jsp"></jsp:include>
        <h1> Listagem </h1>
        <form action="./excluir.jsp" method="post">
        <table class="table table-striped table-success">
            <tr>
                <td> </td>
                <td>Id</td> 
                <td>Nome</td>
                <td>Sexo</td>
                <td>Preferencias</td>
            </tr>
            <% for (int idx = 0; idx < vetPessoa.size(); idx++) {
                    Pessoa p = vetPessoa.get(idx);
            %>
            <tr>
                <td> <input type="checkbox" name="vetId" value="<%=p.getId()%>"> </td>
                <td><%=p.getId()%></td> 
                <td><a href="./tela_editar.jsp?id=<%=p.getId()%>"><%=p.getNome()%></a></td>
                <td><%=p.getSexo()%></td>
                <td><%=p.getPreferencias()%></td>
            </tr>
            <%  } %>

        </table>
            <input type="submit" class="btn-primary" value="Excluir">
            </form>
    </body>
</html>
