<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="alfa.model.Professor"%>
<%@page import="java.util.List"%>
<%@page import="alfa.dao.ProfessorDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Professores</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        
        <%@ include file="menu.jsp" %>
        
        <h2>Professores</h2>
        
        <p><a href="index.jsp">[inicial]</a> <a href="professor-cadastrar.jsp">[novo professor]</a></p>
        
        <table border="1">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Nome</td>
                    <td>Nascimento</td>
                    <td>Salário</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                
                Locale lo = new Locale("pt", "br");
                NumberFormat nf = NumberFormat.getCurrencyInstance(lo);
                    
                ProfessorDao p = new ProfessorDao();
                List<Professor> professores = p.getAll();
                for (Professor professor : professores) {
                %>
                <tr>
                    <td><%= professor.getIdpessoa() %></td>
                    <td><%= professor.getNome() %></td>
                    <td><%= professor.getNascimento().format(df) %></td>
                    <td><%= nf.format(professor.getSalario()) %></td>
                    <td>
                        <a href="professor-editar.jsp?idpessoa=<%= professor.getIdpessoa() %>">[editar]</a>
                        <a href="professor-apagar.jsp?idpessoa=<%= professor.getIdpessoa() %>">[apagar]</a>
                        <a href="endereco-editar.jsp?idpessoa=<%= professor.getIdpessoa() %>">[endereco]</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>
