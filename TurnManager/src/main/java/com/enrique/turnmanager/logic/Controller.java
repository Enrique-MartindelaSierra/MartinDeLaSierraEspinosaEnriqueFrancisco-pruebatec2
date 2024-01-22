package com.enrique.turnmanager.logic;

import com.enrique.turnmanager.persistence.PersistenceController;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Controller {

    PersistenceController persisControl = new PersistenceController();
//CITIZENS CRUD

    public void createCitizen(String dni, String name, String surname) {

        List<Turn> turns = new ArrayList<Turn>();
        persisControl.createCitizen(new Citizen(dni, name, surname, turns));

    }

    public List<Citizen> readCitizens() {
        return persisControl.readCitizens();
    }

    public void deleteCitizen(int id) {
        persisControl.deleteCitizen(id);
    }

    public Citizen findCitizenById(int id) {
        return persisControl.findCitizenById(id);
    }

    public void updateCitizen(String dni, String name, String surname, Citizen citizen) {

        citizen.setDni(dni);
        citizen.setName(name);
        citizen.setSurname(surname);

        persisControl.updateCitizen(citizen);
    }

//TURNS CRUD
    public void createTurn(LocalDate turnDate, String description, Citizen citizen) {

        Turn turn = new Turn(turnDate, description, citizen);
        if (turnDate.isBefore( LocalDate.now())){
            turn.setAttended(true);
        }
        persisControl.createTurn(turn);

    }

    public List<Turn> readTurns() {
        return persisControl.readTurn();
    }

    public void deleteTurn(int id) {
        persisControl.deleteTurn(id);
    }

    public Turn findTurnById(int id) {
        return persisControl.findTurnById(id);
    }

    public void updateTurn(LocalDate turnDate, String description, boolean attended, Turn turn) {

        turn.setTurnDate(turnDate);
        turn.setDescription(description);
        turn.setAttended(attended);

        persisControl.updateTurn(turn);
    }

}
