package com.enrique.turnmanager.persistence;

import com.enrique.turnmanager.logic.Citizen;
import com.enrique.turnmanager.logic.Turn;
import com.enrique.turnmanager.persistence.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersistenceController {

    CitizenJpaController citizenJpa = new CitizenJpaController();
    TurnJpaController turnJpa = new TurnJpaController();

    public void createCitizen(Citizen citizen) {
        citizenJpa.create(citizen);
    }

    public List<Citizen> readCitizens() {
        return citizenJpa.findCitizenEntities();
    }

    public void deleteCitizen(int id) {
        try {
            citizenJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Citizen findCitizenById(int id) {
        return citizenJpa.findCitizen(id);
    }

    public void updateCitizen(Citizen citizen) {
        try {
            citizenJpa.edit(citizen);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createTurn(Turn turn) {
        turnJpa.create(turn);
    }

    public List<Turn> readTurn() {
        return turnJpa.findTurnEntities();
    }

    public void deleteTurn(int id) {
        try {
            turnJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Turn findTurnById(int id) {
        return turnJpa.findTurn(id);
    }

    public void updateTurn(Turn turn) {
        try {
            turnJpa.edit(turn);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
