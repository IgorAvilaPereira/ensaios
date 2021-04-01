<%@page import="javax.mail.MessagingException"%>
<%@page import="mail.JavaEmail"%>
<%
    String message = null;
    String status = null;    
    JavaEmail javaEmail = new JavaEmail();
    javaEmail.setMailServerProperties();
    String emailSubject = "Assunto";
    String emailBody = "Mensagem S29";        
    javaEmail.createEmailMessage(emailSubject, emailBody);
    try {
        javaEmail.sendEmail();
        status = "success";
        message = "Email sent Successfully!";
    } catch (MessagingException me) {
        status = "error";
        message = "Error in Sending Email!";
    }
    out.println("<h1>"+status+":"+message+"</h1>");
    
%>