
package com.enrique.turnmanager.logic;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Turn implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private LocalDate turnDate;
    private String description;
    
    @ManyToOne
    @JoinColumn(name = "citizen_id")
    private Citizen citizen;
    private boolean attended;

    public Turn() {
    }

    public Turn(int id, LocalDate turnDate, String description, Citizen citizen, boolean attended) {
        this.id = id;
        this.turnDate = turnDate;
        this.description = description;
        this.citizen = citizen;
        this.attended = attended;
    }

    public Turn(LocalDate turnDate, String description, Citizen citizen) {
        this.turnDate = turnDate;
        this.description = description;
        this.citizen = citizen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getTurnDate() {
        return turnDate;
    }

    public void setTurnDate(LocalDate turnDate) {
        this.turnDate = turnDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Citizen getCitizen() {
        return citizen;
    }

    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }

    public boolean isAttended() {
        return attended;
    }

    public void setAttended(boolean attended) {
        this.attended = attended;
    }

    @Override
    public String toString() {
        return "Turn{" + "id=" + id + ", turnDate=" + turnDate + ", description=" + description + ", citizen=" + citizen + ", attended=" + attended + '}';
    }
    
    
}
