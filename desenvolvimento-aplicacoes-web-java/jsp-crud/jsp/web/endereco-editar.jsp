<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Endereço</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Editar endereço</h2>

        <% if (msgError.size() > 0) { %>
        <p>Foram encontrados dados inválidos no preenchimento do formulário:</p>
        <ul>
            <% for (int i = 0; i < msgError.size(); i++) {%>
            <li><%= msgError.get(i)%></li>
                <% } %>
        </ul>
        <% }%>

        <h3>Dados do endereço</h3>
        <form action="endereco-editar.jsp" method="post">
            <input type="hidden" name="idpessoa" value="">

            <p>
                <label>Cidade</label>
                <select name="idcidade">
                    <option value="0">Selecione ...</option>
                    <option value=""></option>
                </select>
            </p>

            <p>
                <label>Logradouro</label>
                <input type="text" name="logradouro" value="">
            </p>

            <p>
                <label>Número</label>
                <input type="text" name="numero" value="">
            </p>

            <input type="submit" name="submit" value="Salvar">
        </form>

        <p><a href="aluno.jsp">[alunos]</a> <a href="professor.jsp">[professores]</a></p>
    </body>
</html>
