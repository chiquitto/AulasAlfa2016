<%
  response.setContentType("text/xml");
  
  String[] clientes = new String[5];
  clientes[0] = "Jose Filipino";
  clientes[1] = "Jo�o P� de Feij�o";
  clientes[2] = "Maria Feia";
  clientes[3] = "Lamela Banguela";
  clientes[4] = "Bill Clill";
%>
<clientes>
  <% for (int i = 0; i < 5; i++) { %>
  <cliente><%= clientes[i] %></cliente>
  <% } %>
</clientes>