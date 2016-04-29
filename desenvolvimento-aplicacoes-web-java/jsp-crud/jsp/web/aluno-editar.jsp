<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alunos</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Editar aluno</h2>

        <h3>Dados do aluno</h3>
        <form action="aluno-editar.jsp" method="post">
            <input type="hidden" name="idpessoa" value="">

            <p>
                <label>Número</label>
                <input type="number" name="numero" value="">
            </p>

            <p>
                <label>Nome</label>
                <input type="text" name="nome" value="">
            </p>

            <p>
                <label>Data de nascimento</label>
                <input type="text" name="nascimento" value="">
            </p>

            <p>
                <label>Telefone</label>
                <input type="text" name="fone" value="">
            </p>

            <p>
                <label>Endereço de email</label>
                <input type="email" name="email" value="">
            </p>

            <input type="submit" name="submit" value="Salvar">
        </form>

        <p><a href="aluno.jsp">[alunos]</a></p>
    </body>
</html>
