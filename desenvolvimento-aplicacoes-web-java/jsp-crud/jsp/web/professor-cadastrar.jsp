<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Professores</title>
    </head>
    <body>
        <h1>Sistema de controle de pessoas Alfa</h1>
        <h2>Cadastrar professor</h2>

        <h3>Dados do professor</h3>
        <form action="professor-cadastrar.jsp" method="post">

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

            <p>
                <label>Salario mensal</label>
                R$ <input type="text" name="salario" value="">
            </p>

            <input type="submit" name="submit" value="Cadastrar">
        </form>

        <p><a href="professor.jsp">[professores]</a></p>
    </body>
</html>
