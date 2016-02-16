<%@page import="java.time.format.DateTimeParseException"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="alfa.util.Conexao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Vector"%>
<%@page import="alfa.dao.AlunoDao"%>
<%@page import="alfa.model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String numeroParam = "";
    String nomeParam = "";
    String nascimentoParam = "";
    String foneParam = "";
    String emailParam = "";

    Vector<String> msgError = new Vector(0);

    if (request.getMethod() == "POST") {
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
        
        // LocalDate nascimento = LocalDate.now();
        // NumberFormat formatNumero = NumberFormat.getNumberInstance(new Locale("pt", "BR"));
        /* Date nascimento = new Date();
        try {
            // nascimento = new SimpleDateFormat("dd/MM/yyyy").parse(nascimentoParam);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }*/
        
        LocalDate nascimento = LocalDate.now();
        try {
            nascimento = LocalDate.parse(nascimentoParam, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        } catch (DateTimeParseException ex) {
            ex.printStackTrace();
        }
        
        if (nomeParam.isEmpty()) {
            msgError.add("O valor do campo Nome deve ser preenchido com o nome completo");
        }
        
        if (foneParam.isEmpty()) {
            msgError.add("O valor do campo Telefone deve ser preenchido com o telefone de contato");
        }
        
        if (emailParam.isEmpty()) {
            msgError.add("O valor do campo Email deve ser preenchido com um endereço de email válido");
        }
        
        // Verificar se numero ja existe
        String sql = "Select idpessoa From pessoa Where (tipo = 1) And (numero = ?)";
        PreparedStatement stmt = Conexao.getConexao().prepareStatement(sql);
        stmt.setInt(1, numero);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            msgError.add("Valor do campo Número deve ser distinto de todos os outros Alunos");
        }
        rs.close();
        stmt.close();
        
        if (msgError.size() == 0) {
            // Cadastrar no BD
            Aluno aluno = new Aluno();
            aluno.setNumero(numero);
            aluno.setNome(nomeParam);
            aluno.setFone(foneParam);
            aluno.setEmail(emailParam);
            aluno.setNascimento(nascimento);
            
            AlunoDao alunoDao = new AlunoDao();
            alunoDao.cadastrar(aluno);
            
            // Redirecionar usuario
            String redirectURL = "aluno.jsp";
            response.sendRedirect(redirectURL);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alunos</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Cadastrar aluno</h2>

        <% if (msgError.size() > 0) { %>
        <p>Foram encontrados dados inválidos no preenchimento do formulário:</p>
        <ul>
            <% for (int i = 0; i < msgError.size(); i++) {%>
            <li><%= msgError.get(i)%></li>
                <% } %>
        </ul>
        <% }%>

        <h3>Dados do aluno</h3>
        <form action="aluno-cadastrar.jsp" method="post">
            <p>
                <label>Número</label>
                <input type="number" name="numero" value="<%= numeroParam %>">
            </p>

            <p>
                <label>Nome</label>
                <input type="text" name="nome" value="<%= nomeParam %>">
            </p>

            <p>
                <label>Data de nascimento</label>
                <input type="text" name="nascimento" value="<%= nascimentoParam %>">
            </p>

            <p>
                <label>Telefone</label>
                <input type="text" name="fone" value="<%= foneParam %>">
            </p>

            <p>
                <label>Endereço de email</label>
                <input type="email" name="email" value="<%= emailParam %>">
            </p>

            <input type="submit" name="submit" value="Cadastrar">
        </form>

        <p><a href="aluno.jsp">[alunos]</a></p>
    </body>
</html>
