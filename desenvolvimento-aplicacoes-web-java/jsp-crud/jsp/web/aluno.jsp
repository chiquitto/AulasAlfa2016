<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alunos</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        
        <%@ include file="menu.jsp" %>
        
        <h2>Alunos</h2>
        
        <p><a href="index.jsp">[inicial]</a> <a href="aluno-cadastrar.jsp">[novo aluno]</a></p>
        
        <table border="1">
            <thead>
                <tr>
                    <td>#</td>
                    <td>Número</td>
                    <td>Nome</td>
                    <td>Nascimento</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{idpessoa}</td>
                    <td>{numero}</td>
                    <td>{nome}</td>
                    <td>{nascimento}</td>
                    <td>
                        <a href="aluno-editar.jsp?idpessoa={idpessoa}">[editar]</a>
                        <a href="aluno-apagar.jsp?idpessoa={idpessoa}">[apagar]</a>
                        <a href="endereco-editar.jsp?idpessoa={idpessoa}">[endereco]</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
