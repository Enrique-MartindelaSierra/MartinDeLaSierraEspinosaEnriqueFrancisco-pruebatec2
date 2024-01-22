package com.enrique.turnmanager.servlets;

import com.enrique.turnmanager.logic.Citizen;
import com.enrique.turnmanager.logic.Controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvCitizen", urlPatterns = {"/SvCitizen"})
public class SvCitizen extends HttpServlet {

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

        String dni = request.getParameter("dni");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        // Verificar si el ciudadano ya existe en la base de datos
        List<Citizen> existingCitizens = control.readCitizens();
        Citizen existingCitizen = existingCitizens.stream()
                .filter(e -> e.getDni().equals(dni)
                && e.getName().equals(name)
                && e.getSurname().equals(surname))
                .findFirst()
                .orElse(null);

        if (existingCitizen != null) {
            // El ciudadano ya existe, no es necesario crear uno nuevo
            request.getSession().setAttribute("citizen", existingCitizen);
        } else {
            // El ciudadano no existe, crear uno nuevo
            control.createCitizen(dni, name, surname);

            // Obtener el nuevo ciudadano de la base de datos
            List<Citizen> updatedCitizens = control.readCitizens();
            Citizen newCitizen = updatedCitizens.stream()
                    .filter(e -> e.getDni().equals(dni)
                    && e.getName().equals(name)
                    && e.getSurname().equals(surname))
                    .findFirst()
                    .orElse(new Citizen("error", "error", "error"));

            request.getSession().setAttribute("citizen", newCitizen);
        }

       // response.sendRedirect("fillTurn.jsp"); // asi iba como quiero
       response.sendRedirect("citizenOptions.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
