<%@page import="alfa.model.Aluno"%>
<%@page import="alfa.dao.AlunoDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="alfa.util.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idParam = "";
    String redirectURL = "aluno.jsp";

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
                + " idpessoa, numero, nome, fone, email"
                + " From pessoa Where (tipo = 1) And (idpessoa = ?)";
        PreparedStatement stmtAluno = Conexao.getConexao().prepareStatement(sqlAluno);
        stmtAluno.setInt(1, idpessoa);
        ResultSet rsAluno = stmtAluno.executeQuery();

        if (!rsAluno.next()) {
            exibirHtml = false;
        } else {
            Aluno aluno = new Aluno();
            aluno.setIdpessoa(idpessoa);
            
            AlunoDao alunoDao = new AlunoDao();
            alunoDao.apagar(aluno);
        }
        rsAluno.close();
        stmtAluno.close();

        response.sendRedirect(redirectURL);
    }
%>