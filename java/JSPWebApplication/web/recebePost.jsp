<%-- 
    Document   : recebePost
    Created on : 22/11/2016, 20:20:27
    Author     : iapereira
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.PessoaDAO"%>
<%@page import="modelo.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Nome enviado: <%=request.getParameter("txtnome")%>

        <%
            Pessoa pessoa = new Pessoa();
            pessoa.setNome(request.getParameter("txtnome"));
            out.println(pessoa.getNome());

            PessoaDAO dao = new PessoaDAO();
            ArrayList<Pessoa> vet = dao.listar();
            for (int idx = 0; idx < vet.size(); idx++) {
                Pessoa p = vet.get(idx);
                out.print(p.getNome());
            }
        %>
    </body>
</html>
