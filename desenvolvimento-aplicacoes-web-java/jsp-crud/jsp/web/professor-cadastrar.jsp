<%@page import="alfa.dao.ProfessorDao"%>
<%@page import="alfa.model.Professor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.time.format.DateTimeParseException"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String nome = "";
String nascimento = "";
String fone = "";
String email = "";
String salario = "";

String erro = "";
    
if (request.getMethod() == "POST") {
    nome = request.getParameter("nome");
    nascimento = request.getParameter("nascimento");
    fone = request.getParameter("fone");
    email = request.getParameter("email");
    salario = request.getParameter("salario");
    
    if (nome.isEmpty()) {
        erro = "Nome não pode estar vazio.";
    }
    
    LocalDate nascimento2 = LocalDate.now();
    if (nascimento.isEmpty()) {
        erro += "Nascimento deve ser informado";
    } else {
        DateTimeFormatter f = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        try {
            nascimento2 = LocalDate.parse(nascimento, f);
        } catch (DateTimeParseException e) {
            erro += "Nascimento deve estar no formato dd/mm/yyyy";
        }
    }
    
    if (fone.isEmpty()) {
        erro += "Telefone deve ser informado.";
    }
    
    if (email.isEmpty()) {
        erro += "Email deve ser informado";
    } else {
        email = email.toLowerCase();
    }
    
    BigDecimal salario2 = new BigDecimal(0);
    if (salario.isEmpty()) {
        erro += "Informe o salário";
    } else {
        // salario2 = new BigDecimal(salario);
        
        Locale lo = new Locale("pt", "br");
        NumberFormat nf = NumberFormat.getInstance(lo);
        
        salario2 = new BigDecimal(nf.parse(salario).toString());
    }
    
    if (erro.isEmpty()) {
        Professor professor = new Professor();
        professor.setNome(nome);
        professor.setNascimento(nascimento2);
        professor.setFone(fone);
        professor.setEmail(email);
        professor.setSalario(salario2);
        
        ProfessorDao profDao = new ProfessorDao();
        profDao.cadastrar(professor);
        
        String url = "professor.jsp";
        response.sendRedirect(url);
    }
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Professores</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Cadastrar professor</h2>
        
        <% if (!erro.isEmpty()) { %>
        <p>Erro: <%= erro %></p>
        <% } %>

        <h3>Dados do professor</h3>
        <form action="professor-cadastrar.jsp" method="post">

            <p>
                <label>Nome</label>
                <input type="text" name="nome" value="<%= nome %>">
            </p>

            <p>
                <label>Data de nascimento</label>
                <input type="text" name="nascimento" value="<%= nascimento %>">
            </p>

            <p>
                <label>Telefone</label>
                <input type="text" name="fone" value="<%=fone%>">
            </p>

            <p>
                <label>Endereço de email</label>
                <input type="email" name="email" value="<%=email%>">
            </p>

            <p>
                <label>Salario mensal</label>
                R$ <input type="text" name="salario" value="<%=salario%>">
            </p>

            <input type="submit" name="submit" value="Cadastrar">
        </form>

        <p><a href="professor.jsp">[professores]</a></p>
    </body>
</html>
