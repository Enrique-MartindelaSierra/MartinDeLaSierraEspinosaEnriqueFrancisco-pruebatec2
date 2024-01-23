<%@page import="com.enrique.turnmanager.logic.Turn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edición de Turno</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container">
            <div class="jumbotron">
                <h1 class="display-4">Edición de Turno</h1>
                <p class="lead">Este es el apartado para editar los diferentes turnos del sistema.</p>
            </div>

            <%
                Turn turn = (Turn) request.getSession().getAttribute("turn");
            %>

            <form action="SvTurnEdit" method="POST">
                <div class="form-group">
                    <label for="turnDate">Fecha:</label>
                    <input type="date" class="form-control" id="turnDate" name="turnDate" required value="<%= turn.getTurnDate()%>">
                </div>

                <div class="form-group">
                    <label for="description">Descripción:</label>
                    <textarea class="form-control" id="description" name="description" rows="4" required><%= turn.getDescription()%></textarea>
                </div>

                <div class="form-group">
                    <label>Atendido:</label>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="attendedYes" name="attended" value="true" <%= turn.isAttended() ? "checked" : ""%> required>
                        <label class="form-check-label" for="attendedYes">Sí</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="attendedNo" name="attended" value="false" <%= !turn.isAttended() ? "checked" : ""%> required>
                        <label class="form-check-label" for="attendedNo">No</label>
                    </div>
                </div>

                <input type="hidden" name="citizenId" value="<%= turn.getCitizen().getId()%>">
                <button type="submit" class="btn btn-primary">Modificar turno</button>
            </form>
        </div>

    </body>
</html>
