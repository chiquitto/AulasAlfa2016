<%@page import="java.time.format.DateTimeParseException"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="alfa.dao.ProfessorDao"%>
<%@page import="alfa.model.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nomeParam = "";
    String nascimentoParam = "";
    String foneParam = "";
    String emailParam = "";
    String salarioParam = "";
    BigDecimal salario = new BigDecimal(0);
    NumberFormat formatNumero = NumberFormat.getNumberInstance(new Locale("pt", "BR"));

    Vector<String> msgError = new Vector(0);

    if (request.getMethod() == "POST") {
        nomeParam = request.getParameter("nome");
        nascimentoParam = request.getParameter("nascimento");
        foneParam = request.getParameter("fone");
        emailParam = request.getParameter("email");
        salarioParam = request.getParameter("salario");

        // Validacoes
        if (nomeParam.isEmpty()) {
            msgError.add("O valor do campo Nome deve ser preenchido com o nome completo");
        }
        
        LocalDate nascimento = LocalDate.now();
        try {
            nascimento = LocalDate.parse(nascimentoParam, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        } catch (DateTimeParseException ex) {
            ex.printStackTrace();
        }

        if (foneParam.isEmpty()) {
            msgError.add("O valor do campo Telefone deve ser preenchido com o telefone de contato");
        }

        if (emailParam.isEmpty()) {
            msgError.add("O valor do campo Email deve ser preenchido com um endereço de email válido");
        }

        try {
            salario = new BigDecimal(formatNumero.parse(salarioParam).toString());
            // salario = Float.parseFloat(salarioParam);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
            msgError.add("Valor do campo Salario deve ser o salario mensal do professor");
        }

        if (msgError.size() == 0) {
            // Cadastrar no BD
            Professor professor = new Professor();
            professor.setNome(nomeParam);
            professor.setFone(foneParam);
            professor.setEmail(emailParam);
            professor.setSalario(salario);
            professor.setNascimento(nascimento);

            ProfessorDao professorDao = new ProfessorDao();
            professorDao.cadastrar(professor);

            // Redirecionar usuario
            String redirectURL = "professor.jsp";
            response.sendRedirect(redirectURL);
        }
    }

    String salarioForm = formatNumero.format(salario);
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

        <% if (msgError.size() > 0) { %>
        <p>Foram encontrados dados inválidos no preenchimento do formulário:</p>
        <ul>
            <% for (int i = 0; i < msgError.size(); i++) {%>
            <li><%= msgError.get(i)%></li>
                <% } %>
        </ul>
        <% }%>

        <h3>Dados do professor</h3>
        <form action="professor-cadastrar.jsp" method="post">

            <p>
                <label>Nome</label>
                <input type="text" name="nome" value="<%= nomeParam%>">
            </p>

            <p>
                <label>Data de nascimento</label>
                <input type="text" name="nascimento" value="<%= nascimentoParam %>">
            </p>

            <p>
                <label>Telefone</label>
                <input type="text" name="fone" value="<%= foneParam%>">
            </p>

            <p>
                <label>Endereço de email</label>
                <input type="email" name="email" value="<%= emailParam%>">
            </p>

            <p>
                <label>Salario mensal</label>
                R$ <input type="text" name="salario" value="<%= salarioForm%>">
            </p>

            <input type="submit" name="submit" value="Cadastrar">
        </form>

        <p><a href="professor.jsp">[professores]</a></p>
    </body>
</html>
