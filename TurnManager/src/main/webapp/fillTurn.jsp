

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <h1>Rellenar Datos del Turno</h1>

    <form action="SvTurn" method="POST">
        <label for="date">Fecha:</label>
        <input type="date" id="turnDate" name="turnDate" required><br>

        <label for="description">Descripción:</label>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>

        <button type="submit">Enviar</button>
    </form>

        
        
        
    </body>
</html>
