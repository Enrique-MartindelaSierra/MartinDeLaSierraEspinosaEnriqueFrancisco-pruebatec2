<%-- 
    Document   : showTurns
    Created on : 22 ene 2024, 13:25:05
    Author     : Enrique
--%>

<%@page import="com.enrique.turnmanager.logic.Turn"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Turns</title>
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
                    
                </tr>
            </thead>


            <%
                List<Turn> turnList = (List) request.getSession().getAttribute("turnList");
            %>

            <tbody>
                <% for (Turn turn : turnList) {%>
                <tr>
                    <td><%=turn.getId()%></td>
                    <td><%=turn.getTurnDate()%></td>
                    <td><%=turn.getDescription()%></td>
                    <td><%=turn.isAttended()%></td>
                    <td><%=turn.getCitizen()%></td>
                    
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
                  
                </tr>
            </tfoot>

        </table>




    </body>
</html>
