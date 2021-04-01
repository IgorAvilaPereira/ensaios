<%-- 
    Document   : excluir
    Created on : 11/08/2017, 21:16:28
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
            
            
            Usuario usuario = new Usuario();
            int id = Integer.parseInt(request.getParameter("id"));
            usuario.setId(id);
            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setPreferencia(request.getParameter("preferencias").charAt(0));
            
            boolean resultado = new UsuarioDAO().alterar(usuario);
            if (!resultado) {
               out.println("xabum");
                
            } else {
                response.sendRedirect("./listar.jsp");
            }
        
        %>
    </body>
</html>
