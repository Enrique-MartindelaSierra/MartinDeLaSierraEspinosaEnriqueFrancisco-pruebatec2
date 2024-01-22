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

@WebServlet(name = "SvTurnDelete", urlPatterns = {"/SvTurnDelete"})
public class SvTurnDelete extends HttpServlet {

    Controller control = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int turnId = Integer.parseInt(request.getParameter("turnId"));

        int citizenId = Integer.parseInt(request.getParameter("citizenId"));

        try {
            control.deleteTurn(turnId);
        } catch(Exception ex)  { System.out.println("Doesn't exist in database");
        }
        List<Turn> allTurns = control.readTurns();

        List<Turn> citizenTurnList = allTurns.stream()
                .filter(turn -> turn.getCitizen().getId() == citizenId)
                .collect(Collectors.toList());

        HttpSession mysesion = request.getSession();
        mysesion.setAttribute("citizenTurnList", citizenTurnList);
        System.out.println(citizenId);
        System.out.println(citizenTurnList);

        response.sendRedirect("citizenTurns.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
