
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

         <h1>Rellenar Datos del Ciudadano</h1>

    <form action="SvCitizen" method="POST">
        <label for="dni">DNI:</label>
        <input type="text" id="dni" name="dni" required><br>

        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="surname">Apellido:</label>
        <input type="text" id="surname" name="surname" required><br>

        <button type="submit">Enviar</button>
    </form>

        
        
        
        
        
        
        
        
        
    </body>
</html>
