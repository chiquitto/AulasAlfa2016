<%@page import="alfa.model.Professor"%>
<%@page import="alfa.dao.ProfessorDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="alfa.util.Conexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idParam = "";
    String redirectURL = "professor.jsp";

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
        String sql = "Select"
                + " idpessoa"
                + " From pessoa Where (tipo = 2) And (idpessoa = ?)";
        PreparedStatement stmt = Conexao.getConexao().prepareStatement(sql);
        stmt.setInt(1, idpessoa);
        ResultSet rs = stmt.executeQuery();

        if (!rs.next()) {
            exibirHtml = false;
        } else {
            Professor professor = new Professor();
            professor.setIdpessoa(idpessoa);
            
            ProfessorDao professorDao = new ProfessorDao();
            professorDao.apagar(professor);
        }
        rs.close();
        stmt.close();

        response.sendRedirect(redirectURL);
    }
%>