<% //exer-calc-etanolgasolina2.jsp %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
(...)
<h1>Resultado do cálculo</h1>
<%
String etanolString = request.getParameter("etanol");
String gasolinaString = request.getParameter("gasolina");
double etanol = Double.parseDouble(etanolString);
double gasolina = Double.parseDouble(gasolinaString);
double relacao = etanol / gasolina;
%>
<h2>Valores informados</h2>
<p>Etanol: R$ <%= etanolString %></p>
<p>Gasolina: R$ <%= gasolinaString %></p>
<p>Relação entre os preços: <%= relacao %></p>

<h2>Resultado:</h2>
<% if (relacao < 0.7) { %><p>A melhor escolha é Etanol</p>
<% } else { %><p>A melhor escolha é Gasolina</p>
<% } %>
(...)