<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="alfa.dao.AlunoDao"%>
<%@page import="alfa.model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alunos</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Alunos</h2>
        
        <p><a href="index.jsp">[inicial]</a> <a href="aluno-cadastrar.jsp">[novo aluno]</a></p>
        
        <table border="1">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Número</td>
                    <td>Nome</td>
                    <td>Nascimento</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    AlunoDao alunoDao = new AlunoDao();
                    List<Aluno> alunos = alunoDao.getAll();
                    
                    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    
                    for (Aluno aluno : alunos) {
                %>
                <tr>
                    <td><%= aluno.getIdpessoa() %></td>
                    <td><%= aluno.getNumero() %></td>
                    <td><%= aluno.getNome() %></td>
                    <td><%= aluno.getNascimento().format(dateTimeFormatter) %></td>
                    <td>
                        <a href="aluno-editar.jsp?idpessoa=<%= aluno.getIdpessoa()%>">[editar]</a>
                        <a href="aluno-apagar.jsp?idpessoa=<%= aluno.getIdpessoa()%>">[apagar]</a>
                        <a href="endereco-editar.jsp?idpessoa=<%= aluno.getIdpessoa()%>">[endereco]</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
