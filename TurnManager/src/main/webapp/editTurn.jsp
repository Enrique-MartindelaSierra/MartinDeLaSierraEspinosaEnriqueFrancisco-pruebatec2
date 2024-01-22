<%-- 
    Document   : editTurn
    Created on : 22 ene 2024, 21:37:26
    Author     : Enrique
--%>

<%@page import="com.enrique.turnmanager.logic.Turn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edición de Turno</h1>
        <p>Este es el apartado para editar los diferentes turnos del sistema.</p>

        <%
            Turn turn = (Turn) request.getSession().getAttribute("turn");
        %>

        <form action="SvTurnEdit" method="POST">
            <label for="date">Fecha:</label>
            <input type="date" id="turnDate" name="turnDate" required><br>

            <label for="description">Descripción:</label>
            <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>                        

            <label for="attended">Atendido:</label>
            <input type="radio" id="attendedYes" name="attended" value="true" required>
            <label for="attendedYes">Sí</label>
            <input type="radio" id="attendedNo" name="attended" value="false" required>
            <label for="attendedNo">No</label><br>

            <input type="hidden" name="citizenId" value="<%= turn.getCitizen().getId()%>">
            <button type="submit">
                Modificar turno
            </button>

        </form> 
    </body>
</html>
