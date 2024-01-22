package com.enrique.turnmanager.servlets;

import com.enrique.turnmanager.logic.Citizen;
import com.enrique.turnmanager.logic.Controller;
import com.enrique.turnmanager.logic.Turn;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvTurn", urlPatterns = {"/SvTurn"})
public class SvTurn extends HttpServlet {

    Controller control = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Turn> turnList = control.readTurns();

        HttpSession mysession = request.getSession();
        mysession.setAttribute("turnList", turnList);

        response.sendRedirect("showTurns.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String turnDate = request.getParameter("turnDate");
        String description = request.getParameter("description");

        // Recuperar el objeto Citizen de la sesión
        Citizen citizen = (Citizen) request.getSession().getAttribute("citizen");

        // Aquí puedes realizar la lógica de negocio y almacenar el objeto Turn en la base de datos
        control.createTurn(LocalDate.parse(turnDate), description, citizen);

//este es el doGET de SvTurnFilter para ver si funciona en un unico boton y funciona perfecto
        List<Turn> allTurns = control.readTurns();

        List<Turn> citizenTurnList = allTurns.stream()
                .filter(turn -> turn.getCitizen().getId() == citizen.getId())
                .collect(Collectors.toList());

        HttpSession mysesion = request.getSession();
        mysesion.setAttribute("citizenTurnList", citizenTurnList);

        response.sendRedirect("citizenTurns.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
