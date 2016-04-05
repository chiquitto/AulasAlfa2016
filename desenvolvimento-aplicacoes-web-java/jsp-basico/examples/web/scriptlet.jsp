<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
      <% String pais = "Brasil"; %>
      <h1><% out.print(pais); %></h1>
      
      <ul>
        <% for (int i = 0; i < 3; i++) { %>
        <li><% out.print(i); %></li>
        <% } %>
      </ul>
      
      <%! int contador = 1; %>
      <%= contador %>
      <% contador++; %>
      
      <ul>
        <% for (int i = 5; i < 30; i++) { %>
        <li><%= i %></li>
        <% } %>
      </ul>
      
  </body>
</html>
