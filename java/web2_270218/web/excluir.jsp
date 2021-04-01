<%-- 
    Document   : excluir
    Created on : 27/02/2018, 20:21:35
    Author     : iapereira
--%>

<%@page import="persistencia.PessoaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String vetId[] = request.getParameterValues("vetId");
            int vetIdReal[] = new int[vetId.length];
            PessoaDAO pessoaDAO = new PessoaDAO();
            for (int i = 0; i < vetId.length; i++) {
                vetIdReal[i] = Integer.parseInt(vetId[i]);
                //pessoaDAO.excluir(Integer.parseInt(vetId[i]));
            }
            pessoaDAO.excluir(vetIdReal);
            response.sendRedirect("./listar.jsp");
        %>
    </body>
</html>
