<%@page import="com.enrique.turnmanager.logic.Turn"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Lista de Turnos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                padding: 20px;
            }
            .btn-container {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>Lista de Turnos</h1>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Descripción</th>
                        <th>Atendido?</th>
                        <th>Ciudadano</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <%
                    List<Turn> turnList = (List) request.getSession().getAttribute("citizenTurnList");
                %>

                <tbody>
                    <% for (Turn turn : turnList) {%>
                    <tr>
                        <td><%=turn.getId()%></td>
                        <td><%=turn.getTurnDate()%></td>
                        <td><%=turn.getDescription()%></td>
                        <td><%=turn.isAttended()%></td>
                        <td><%=turn.getCitizen()%></td>
                        <td>
                            <form action="SvTurnDelete" method="POST">
                                <input type="hidden" name="turnId" value="<%= turn.getId()%>">
                                <input type="hidden" name="citizenId" value="<%= turn.getCitizen().getId()%>">
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </form>
                            <form action="SvTurnEdit" method="GET">
                                <input type="hidden" name="turnId" value="<%= turn.getId()%>">                           
                                <button type="submit" class="btn btn-warning">Editar</button>
                            </form>
                        </td>
                    </tr>    
                    <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Descripción</th>
                        <th>Atendido?</th>
                        <th>Ciudadano</th>
                        <th>Acción</th>
                    </tr>
                </tfoot>
            </table>

            <div class="btn-container">
                <form action="SvTurnFilterByDate" method="GET" class="form-inline">
                    <div class="form-group">
                        <label for="turnDate">Filtrar por fecha:</label>
                        <input type="date" id="turnDate" name="turnDate" required class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary ml-2">Filtrar</button>
                </form>

                <form action="SvTurnFilterByAttended" method="GET" class="form-inline">
                    <button type="submit" class="btn btn-primary ml-2">Filtrar por atendido</button>
                </form>

                <form action="SvTurnFilterByCitizen" method="GET" class="form-inline">
                    <button type="submit" class="btn btn-primary ml-2">Todos mis Turnos</button>
                </form>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
