package com.enrique.turnmanager.logic;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Citizen implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String dni;
    private String name;
    private String surname;
    
    @OneToMany(mappedBy = "citizen", cascade = CascadeType.ALL)
    private List<Turn> turns;

    public Citizen() {
    }

    public Citizen(int id, String dni, String name, String surname, List<Turn> turns) {
        this.id = id;
        this.dni = dni;
        this.name = name;
        this.surname = surname;
        this.turns = turns;
    }

    public Citizen(String dni, String name, String surname) {
        this.dni = dni;
        this.name = name;
        this.surname = surname;
    }

    public Citizen(String dni, String name, String surname, List<Turn> turns) {
        this.dni = dni;
        this.name = name;
        this.surname = surname;
        this.turns = turns;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public List<Turn> getTurns() {
        return turns;
    }

    public void setTurns(List<Turn> turns) {
        this.turns = turns;
    }

    @Override
    public String toString() {
        return "Id: " + id  + ". " + name + " " + surname + ". DNI: " + dni;
    }
    
    
}
