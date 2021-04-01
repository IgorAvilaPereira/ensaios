<%-- 
    Document   : excluir
    Created on : 11/08/2017, 21:16:28
    Author     : iapereira
--%>

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
            
            int id = Integer.parseInt(request.getParameter("id"));
            boolean resultado = new UsuarioDAO().excluir(id);
            if (!resultado) {
               out.println("xabum");                
            } else {
                response.sendRedirect("./listar.jsp");
            }
        
        %>
    </body>
</html>
