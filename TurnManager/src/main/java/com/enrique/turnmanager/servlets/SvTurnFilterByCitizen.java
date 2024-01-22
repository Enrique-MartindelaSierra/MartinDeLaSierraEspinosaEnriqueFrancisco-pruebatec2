package com.enrique.turnmanager.servlets;

import com.enrique.turnmanager.logic.Citizen;
import com.enrique.turnmanager.logic.Controller;
import com.enrique.turnmanager.logic.Turn;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvTurnFilterByCitizen", urlPatterns = {"/SvTurnFilterByCitizen"})
public class SvTurnFilterByCitizen extends HttpServlet {

    Controller control = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Turn> allTurns = control.readTurns();

        Citizen citizen = (Citizen) request.getSession().getAttribute("citizen");

        List<Turn> citizenTurnList = allTurns.stream()
                .filter(turn -> turn.getCitizen().getId() == citizen.getId())
                .collect(Collectors.toList());

        HttpSession mysesion = request.getSession();
        mysesion.setAttribute("citizenTurnList", citizenTurnList);

        response.sendRedirect("citizenTurns.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
