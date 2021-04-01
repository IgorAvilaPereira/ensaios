<%-- 
    Document   : listar
    Created on : 11/08/2017, 20:48:43
    Author     : iapereira
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
        <style>
            tr {
                background-color: red;
                color: white;
            }

        </style>
    </head>
    <body>
        <table border="1"> 
            <%
                ArrayList<Usuario> vet = new UsuarioDAO().listar();
                for (Usuario usuario : vet) {
            %>
            <tr>
                <td> <a href="./excluir.jsp?id=<%=usuario.getId()%>" class="btn btn-primary"> Excluir </a> </td>
                <td> <a href="./tela_alterar.jsp?id=<%=usuario.getId()%>" class="btn btn-primary"> Alterar </a> </td>
                <td><%=usuario.getEmail()%> </td> 
                <td><%=usuario.getNome()%> </td> 
                <td><%=usuario.getPreferencia()%> </td>
            </tr>
            <% }%>
        </table>

    </body>
</html>
