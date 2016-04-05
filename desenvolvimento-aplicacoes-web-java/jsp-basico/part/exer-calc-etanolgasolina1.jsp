<% //exer-calc-etanolgasolina1.jsp %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
(...)
<h1>Calculadora Etanol x Gasolina</h1>
<form method="post" action="exer-calc-etanolgasolina2.jsp">
  <p>Informe o preço do Etanol e da Gasolina, e em seguida clique em Calcular.</p>
  <p>
    <label>Etanol: <input type="text" name="etanol"></label>
  </p>
  <p>
    <label>Gasolina: <input type="text" name="gasolina"></label>
  </p>
  <p><input type="submit" name="submit" value="Calcular"></p>
  <p><small>Obs.: Use ponto para casas decimais.</small></p>
</form>
(...)