<%-- 
    Document   : excluir_multiplo
    Created on : 08/03/2017, 21:16:57
    Author     : iapereira
--%>

<%@page import="persistencia.GarotaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = -1;
            if (request.getParameterValues("id") != null) {
                String vetId[] = request.getParameterValues("id");
                int tamanho = vetId.length;
                for (int idx = 0; idx < tamanho; idx++) {
                    id = Integer.parseInt(vetId[idx]);
                    boolean resultado = new GarotaDAO().excluir(id);
                    out.println("Foi?"+resultado);
                }
            }
        %>
        <a href ="./index.jsp"> Voltar </a>
    </body>
</html>
