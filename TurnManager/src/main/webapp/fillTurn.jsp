<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Rellenar Datos del Turno</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="jumbotron">
        <h1 class="display-4">Rellenar Datos del Turno</h1>
        <p class="lead">Utiliza el siguiente formulario para programar un nuevo turno.</p>
    </div>

    <form action="SvTurn" method="POST">
        <div class="form-group">
            <label for="turnDate">Fecha:</label>
            <input type="date" class="form-control" id="turnDate" name="turnDate" required>
        </div>

        <div class="form-group">
            <label for="description">Descripción:</label>
            <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
</div>

</body>
</html>
