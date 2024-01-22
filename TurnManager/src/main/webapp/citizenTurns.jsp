
<%@page import="com.enrique.turnmanager.logic.Turn"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>





        <h1>Lista de Turnos</h1>

        <table id="turnTable" width="100%" cellspacing="0" border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Desripcion</th>
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
                            <button type="submit">Eliminar</button>
                        </form>
                        <form action="SvTurnEdit" method="GET">
                            <input type="hidden" name="turnId" value="<%= turn.getId()%>">                           
                            <button type="submit">Editar</button>
                        </form>
                    </td>
                </tr>    

                <%}%>

            </tbody>   

            <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Fecha</th>
                    <th>Desripcion</th>
                    <th>Atendido?</th>
                    <th>Ciudadano</th>
                    <th>Acción</th>
                </tr>
            </tfoot>

        </table>

        <form action="SvTurnFilterByDate" method="GET">
            <input type="date" id="turnDate" name="turnDate" required><br>
            <button type="submit">Filtrar por fecha</button>
        </form>

        <form action="SvTurnFilterByAttended" method="GET">
            <button type="submit">Filtrar por atendido</button>
        </form>

        <form action="SvTurnFilterByCitizen" method="GET">
            <button type="submit">todos mis Turnos</button>
        </form>



    </body>
</html>
