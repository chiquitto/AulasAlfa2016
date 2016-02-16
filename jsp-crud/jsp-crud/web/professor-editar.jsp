<%@page import="java.time.format.DateTimeParseException"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="alfa.dao.ProfessorDao"%>
<%@page import="alfa.model.Professor"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="alfa.util.Conexao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Vector"%>
<%@page import="alfa.dao.AlunoDao"%>
<%@page import="alfa.model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idParam = "";
    String nomeParam = "";
    String nascimentoParam = "";
    String foneParam = "";
    String emailParam = "";
    
    // String salarioParam = "";
    BigDecimal salario = new BigDecimal(0);
    NumberFormat formatNumero = NumberFormat.getNumberInstance(new Locale("pt", "BR"));
    
    LocalDate nascimento = LocalDate.now();
    
    String redirectURL = "professor.jsp";

    Vector<String> msgError = new Vector(0);
    boolean exibirHtml = true;

    int idpessoa = 0;
    try {
        idParam = request.getParameter("idpessoa");
        idpessoa = Integer.parseInt(idParam);
    } catch (NumberFormatException ex) {
        ex.printStackTrace();

        exibirHtml = false;
        response.sendRedirect(redirectURL + "?a=1");
    }

    if (exibirHtml) {
        String sqlProfessor = "Select"
                + " idpessoa, nome, fone, email, salario, nascimento"
                + " From pessoa Where (tipo = 2) And (idpessoa = ?)";
        PreparedStatement stmtProfessor = Conexao.getConexao().prepareStatement(sqlProfessor);
        stmtProfessor.setInt(1, idpessoa);
        ResultSet rsProfessor = stmtProfessor.executeQuery();
        if (!rsProfessor.next()) {
            exibirHtml = false;
            response.sendRedirect(redirectURL + "?a=2");
        } else {
            nomeParam = rsProfessor.getString("nome");
            
            nascimento = LocalDate.parse(rsProfessor.getString("nascimento"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            nascimentoParam = nascimento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            
            foneParam = rsProfessor.getString("fone");
            emailParam = rsProfessor.getString("email");
            
            salario = rsProfessor.getBigDecimal("salario");
        }
        rsProfessor.close();
        stmtProfessor.close();
    }

    if ((exibirHtml) && (request.getMethod() == "POST")) {
        nomeParam = request.getParameter("nome");
        nascimentoParam = request.getParameter("nascimento");
        foneParam = request.getParameter("fone");
        emailParam = request.getParameter("email");
        
        String salarioParam = request.getParameter("salario");

        // Validacoes
        if (nomeParam.isEmpty()) {
            msgError.add("O valor do campo Nome deve ser preenchido com o nome completo");
        }
        
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
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
            msgError.add("Valor do campo Salario deve ser o salario mensal do professor");
        }

        if (msgError.size() == 0) {
            // Cadastrar no BD
            Professor professor = new Professor();
            professor.setIdpessoa(idpessoa);
            professor.setNome(nomeParam);
            professor.setNascimento(nascimento);
            professor.setFone(foneParam);
            professor.setEmail(emailParam);
            professor.setSalario(salario);

            ProfessorDao professorDao = new ProfessorDao();
            professorDao.editar(professor);

            // Redirecionar usuario
            response.sendRedirect(redirectURL + "?a=3");
        }
    }

    if (exibirHtml) {
        
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
        <h2>Editar professor</h2>

        <% if (msgError.size() > 0) { %>
        <p>Foram encontrados dados inválidos no preenchimento do formulário:</p>
        <ul>
            <% for (int i = 0; i < msgError.size(); i++) {%>
            <li><%= msgError.get(i)%></li>
                <% } %>
        </ul>
        <% }%>

        <h3>Dados do professor</h3>
        <form action="professor-editar.jsp" method="post">
            <input type="hidden" name="idpessoa" value="<%= idParam%>">

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

            <input type="submit" name="submit" value="Salvar">
        </form>

        <p><a href="professor.jsp">[professores]</a></p>
    </body>
</html>
<% }%>
