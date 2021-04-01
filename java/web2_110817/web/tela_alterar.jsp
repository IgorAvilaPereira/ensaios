<%-- 
    Document   : tela_alterar
    Created on : 11/08/2017, 21:24:51
    Author     : iapereira
--%>

<%@page import="modelo.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Usuario usuario = new UsuarioDAO().obter(Integer.parseInt(request.getParameter("id"))); %>
        <form action="./alterar.jsp" method="post">
            Nome: <input type="text" name="nome" value="<%=usuario.getNome()%>">
            <br>
            Email: <input type="email" name="email" value="<%=usuario.getEmail()%>" required>
            <br>
            Preferencias:  <br>
            <input type="radio" name="preferencias" value="F" <%=((usuario.getPreferencia() == 'F') ? "checked" : "")%> > Mulher
            <input type="radio" name="preferencias" value="M" <%=((usuario.getPreferencia() == 'M') ? "checked" : "")%>> Homem
            <input type="radio" name="preferencias" value="T" <%=((usuario.getPreferencia() == 'T') ? "checked" : "")%>> Todos
            <input type="hidden" name="id" value="<%=usuario.getId() %>">
            <input type="submit">
        </form>
    </body>
</html>
