<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido a TurnManager</title>
    <!-- Importación de Bootstrap (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        header {
            margin-bottom: 20px;
        }

        h1 {
            color: #fff; /* Aseguramos que el texto sea blanco */
        }

        button {
            margin-top: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="p-3 bg-dark text-white">
            <h1>Bienvenido a TurnManager</h1>
        </header>
        
        <a href="fillCitizen.jsp" class="btn btn-primary btn-lg">Identifícate</a>

        <form action="SvTurn" method="GET">
            <button type="submit" class="btn btn-success btn-lg">Todos los Turnos</button>
        </form>
    </div>

    <!-- Importación de Bootstrap (CDN) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
