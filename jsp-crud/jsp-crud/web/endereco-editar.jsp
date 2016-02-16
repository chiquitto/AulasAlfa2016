<%@page import="alfa.dao.EnderecoDao"%>
<%@page import="alfa.model.Endereco"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="alfa.util.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="alfa.dao.CidadeDao"%>
<%@page import="alfa.model.Cidade"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String idParam = "";
    String idcidadeParam = "";
    String logradouroParam = "";
    String numeroParam = "";

    int idcidade = 0;

    Vector<String> msgError = new Vector(0);
    boolean exibirHtml = true;

    String redirectURL = "index.jsp";

    int idpessoa = 0;
    try {
        idParam = request.getParameter("idpessoa");
        idpessoa = Integer.parseInt(idParam);
    } catch (NumberFormatException ex) {
        ex.printStackTrace();

        exibirHtml = false;
        response.sendRedirect(redirectURL);
    }

    // Verificar se cliente existe
    if (exibirHtml) {
        String sqlPessoa = "Select idpessoa, tipo, nome From pessoa Where idpessoa = ?";
        PreparedStatement stmtPessoa = Conexao.getConexao().prepareStatement(sqlPessoa);
        stmtPessoa.setInt(1, idpessoa);
        ResultSet rsPessoa = stmtPessoa.executeQuery();

        if (!rsPessoa.next()) {
            exibirHtml = false;
            response.sendRedirect(redirectURL);
        }
    }

    // Verificar se ja existe endereco para a pessoa
    if (exibirHtml) {
        String sqlEndereco = "Select idcidade, logradouro, numero From endereco Where idpessoa = ?";
        PreparedStatement stmtEndereco = Conexao.getConexao().prepareStatement(sqlEndereco);
        stmtEndereco.setInt(1, idpessoa);
        ResultSet rsEndereco = stmtEndereco.executeQuery();

        if (rsEndereco.next()) {
            idcidade = rsEndereco.getInt("idcidade");
            logradouroParam = rsEndereco.getString("logradouro");
            numeroParam = rsEndereco.getString("numero");
        }
    }

    if ((exibirHtml) && (request.getMethod() == "POST")) {
        idcidadeParam = request.getParameter("idcidade");
        try {
            idcidade = Integer.parseInt(idcidadeParam);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();

            exibirHtml = false;
            response.sendRedirect(redirectURL);
        }

        logradouroParam = request.getParameter("logradouro");
        numeroParam = request.getParameter("numero");
        
        if (logradouroParam.isEmpty()) {
            msgError.add("Campo logradouro não deve ficar vazio");
        }
        if (numeroParam.isEmpty()) {
            msgError.add("Campo número não deve ficar vazio");
        }
        
        Endereco endereco = new Endereco();
        endereco.setIdpessoa(idpessoa);
        endereco.setIdcidade(idcidade);
        endereco.setLogradouro(logradouroParam);
        endereco.setNumero(numeroParam);
        
        new EnderecoDao().salvar(endereco);
    }

    if (exibirHtml) {
%>
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
            <input type="hidden" name="idpessoa" value="<%= idParam%>">

            <p>
                <label>Cidade</label>
                <select name="idcidade">
                    <option value="0">Selecione ...</option>
                    <%
                        List<Cidade> cidades = new CidadeDao().getAll();
                        for (Cidade cidade : cidades) {
                    %>
                    <option value="<%= cidade.getIdcidade()%>"<% if (cidade.getIdcidade() == idcidade) { %> selected<% }%>>
                        <%= cidade.getCidade()%></option>
                        <% }%>
                </select>
            </p>

            <p>
                <label>Logradouro</label>
                <input type="text" name="logradouro" value="<%= logradouroParam%>">
            </p>

            <p>
                <label>Número</label>
                <input type="text" name="numero" value="<%= numeroParam%>">
            </p>

            <input type="submit" name="submit" value="Salvar">
        </form>

        <p><a href="aluno.jsp">[alunos]</a> <a href="professor.jsp">[professores]</a></p>
    </body>
</html>
<% }%>
