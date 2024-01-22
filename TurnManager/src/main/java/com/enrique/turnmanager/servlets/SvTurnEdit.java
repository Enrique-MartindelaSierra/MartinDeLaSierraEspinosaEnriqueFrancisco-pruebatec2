package com.enrique.turnmanager.servlets;

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

@WebServlet(name = "SvTurnEdit", urlPatterns = {"/SvTurnEdit"})
public class SvTurnEdit extends HttpServlet {

    Controller control = new Controller();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("turnId"));
        Turn turn = control.findTurnById(id);

        System.out.println(turn);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("turn", turn);

        response.sendRedirect("editTurn.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int citizenId = Integer.parseInt(request.getParameter("citizenId"));

        LocalDate turnDate = LocalDate.parse(request.getParameter("turnDate"));
        String description = request.getParameter("description");
        boolean attended = Boolean.parseBoolean(request.getParameter("attended"));

        try {
            control.updateTurn(turnDate, description, attended, (Turn) request.getSession().getAttribute("turn"));
        } catch (Exception ex) {
            System.out.println("Doesn't exist in database");
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
