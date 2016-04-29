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
                <tr>
                    <td>{idpessoa}</td>
                    <td>{nome}</td>
                    <td>{nascimento}</td>
                    <td>{salario}</td>
                    <td>
                        <a href="professor-editar.jsp?idpessoa={idpessoa}">[editar]</a>
                        <a href="professor-apagar.jsp?idpessoa={idpessoa}">[apagar]</a>
                        <a href="endereco-editar.jsp?idpessoa={idpessoa}">[endereco]</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
