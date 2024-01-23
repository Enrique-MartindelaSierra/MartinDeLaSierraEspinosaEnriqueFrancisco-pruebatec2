<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Datos Ciudadano</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
    </style>
</head>
<body>

    <header class="container-fluid bg-dark text-white text-center py-3 mb-4">
        <h1>Rellenar Datos del Ciudadano</h1>
    </header>

    <div class="container">
        <form action="SvCitizen" method="POST">
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" required><br>

            <label for="name">Nombre:</label>
            <input type="text" id="name" name="name" required><br>

            <label for="surname">Apellido:</label>
            <input type="text" id="surname" name="surname" required><br>

            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
