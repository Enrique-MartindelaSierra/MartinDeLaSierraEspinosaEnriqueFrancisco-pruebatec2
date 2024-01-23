<%@page import="com.enrique.turnmanager.logic.Turn"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>All Turns</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
    </style>
</head>
<body>

    <header class="container-fluid bg-dark text-white text-center py-3 mb-4">
        <h1>Lista de Turnos</h1>
    </header>

    <div class="container">
        <table class="table table-bordered" id="turnTable">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Atendido</th>
                    <th scope="col">Ciudadano</th>
                </tr>
            </thead>
              <%
                List<Turn> turnList = (List) request.getSession().getAttribute("turnList");
            %>
            <tbody>
                <% for (Turn turn : turnList) { %>
                    <tr>
                        <th scope="row"><%= turn.getId() %></th>
                        <td><%= turn.getTurnDate() %></td>
                        <td><%= turn.getDescription() %></td>
                        <td><%= turn.isAttended() %></td>
                        <td><%= turn.getCitizen() %></td>
                    </tr>
                <% } %>
            </tbody>
            <tfoot class="thead-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Fecha</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Atendido</th>
                    <th scope="col">Ciudadano</th>
                </tr>
            </tfoot>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
