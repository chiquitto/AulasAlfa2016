<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<p>Olá usuário, <%
  Calendar cal = Calendar.getInstance();
  int hora = cal.get(Calendar.HOUR_OF_DAY);

  if (hora < 6) {
    out.print("boa madrugada");
  } else if (hora < 12) {
    out.print("bom dia");
  } else if (hora < 18) {
    out.print("boa tarde");
  } else {
    out.print("boa noite");
  }
  %>.</p>