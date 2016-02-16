<%@page import="java.time.format.DateTimeParseException"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="alfa.util.Conexao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="alfa.dao.AlunoDao"%>
<%@page import="alfa.model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idParam = "";
    String numeroParam = "";
    String nomeParam = "";
    String nascimentoParam = "";
    String foneParam = "";
    String emailParam = "";
    
    String redirectURL = "aluno.jsp";
    
    // DateFormat dtFormatBr = new SimpleDateFormat("dd/MM/yyyy");
    LocalDate nascimento = LocalDate.now();

    Vector<String> msgError = new Vector(0);
    boolean exibirHtml = true;

    int idpessoa = 0;
    try {
        idParam = request.getParameter("idpessoa");
        idpessoa = Integer.parseInt(idParam);
    } catch (NumberFormatException ex) {
        ex.printStackTrace();

        exibirHtml = false;
        response.sendRedirect(redirectURL);
    }

    if (exibirHtml) {
        String sqlAluno = "Select"
                + " idpessoa, numero, nome, fone, email, nascimento"
                + " From pessoa Where (tipo = 1) And (idpessoa = ?)";
        PreparedStatement stmtAluno = Conexao.getConexao().prepareStatement(sqlAluno);
        stmtAluno.setInt(1, idpessoa);
        ResultSet rsAluno = stmtAluno.executeQuery();
        if (!rsAluno.next()) {
            exibirHtml = false;
            response.sendRedirect(redirectURL);
        } else {
            numeroParam = rsAluno.getString("numero");
            nomeParam = rsAluno.getString("nome");
            
            // db to user
            // Date nascimento = new SimpleDateFormat("yyyy-MM-dd").parse(rsAluno.getString("nascimento"));
            // nascimentoParam = dtFormatBr.format(nascimento);
            nascimento = LocalDate.parse(rsAluno.getString("nascimento"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            nascimentoParam = nascimento.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            
            foneParam = rsAluno.getString("fone");
            emailParam = rsAluno.getString("email");
        }
        rsAluno.close();
        stmtAluno.close();
    }

    if ((exibirHtml) && (request.getMethod() == "POST")) {
        numeroParam = request.getParameter("numero");
        nomeParam = request.getParameter("nome");
        nascimentoParam = request.getParameter("nascimento");
        foneParam = request.getParameter("fone");
        emailParam = request.getParameter("email");

        // Validacoes
        int numero = 0;
        try {
            numero = Integer.parseInt(numeroParam);
        } catch (NumberFormatException e) {
            msgError.add("Valor do campo Número deve ser um número inteiro");
        }

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

        // Verificar se numero ja existe
        String sql = "Select idpessoa From pessoa Where (tipo = 1) And (numero = ?) And (idpessoa != ?)";
        PreparedStatement stmt = Conexao.getConexao().prepareStatement(sql);
        stmt.setInt(1, numero);
        stmt.setInt(2, idpessoa);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            msgError.add("Valor do campo Número deve ser distinto de todos os outros Alunos");
        }
        rs.close();
        stmt.close();

        if (msgError.size() == 0) {
            // Cadastrar no BD
            Aluno aluno = new Aluno();
            aluno.setIdpessoa(idpessoa);
            aluno.setNumero(numero);
            aluno.setNome(nomeParam);
            aluno.setNascimento(nascimento);
            aluno.setFone(foneParam);
            aluno.setEmail(emailParam);

            AlunoDao alunoDao = new AlunoDao();
            alunoDao.editar(aluno);

            // Redirecionar usuario
            response.sendRedirect(redirectURL);
        }
    }

    if (exibirHtml) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alunos</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Editar aluno</h2>

        <% if (msgError.size() > 0) { %>
        <p>Foram encontrados dados inválidos no preenchimento do formulário:</p>
        <ul>
            <% for (int i = 0; i < msgError.size(); i++) {%>
            <li><%= msgError.get(i)%></li>
                <% } %>
        </ul>
        <% }%>

        <h3>Dados do aluno</h3>
        <form action="aluno-editar.jsp" method="post">
            <input type="hidden" name="idpessoa" value="<%= idParam%>">

            <p>
                <label>Número</label>
                <input type="number" name="numero" value="<%= numeroParam%>">
            </p>

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

            <input type="submit" name="submit" value="Salvar">
        </form>

        <p><a href="aluno.jsp">[alunos]</a></p>
    </body>
</html>
<% }%>
