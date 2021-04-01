<%-- 
    Document   : adicionar
    Created on : 11/08/2017, 20:20:24
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
        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            char preferencias = request.getParameter("preferencias").charAt(0);
            Usuario usuario = new Usuario();
            usuario.setEmail(email);
            usuario.setNome(nome);
            usuario.setPreferencia(preferencias);
            boolean resultado = new UsuarioDAO().adicionar(usuario);
            if (resultado) { 
                out.println("<h1> Sucesso!! </h1>");
            } else {
                out.println("<h1> Xabum     !! </h1>");
            }
        %>
    </body>
</html>
