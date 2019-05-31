/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Gianluca
 */

/*Creo una classe pubblica con gli elementi che mi serve compaiano nelle pagine
e per ognuno avrò dei valori fittizi nella factory*/
public class Valutazione {
    
    private int id_valutazione;
    private int id_articolo;
    private int id_autore;
    private int voto;
    private String commaut;
    private String commorg;

    /**
     * @return the id_valutazione
     */
    public int getId_valutazione() {
        return id_valutazione;
    }

    /**
     * @param id the id_valutazione to set
     */
    public void setId_valutazione(int id) {
        this.id_valutazione = id;
    }

    /**
     * @return the id_articolo
     */
    public int getId_articolo() {
        return id_articolo;
    }

    /**
     * @param id_articolo the id_articolo to set
     */
    public void setId_articolo(int id_articolo) {
        this.id_articolo = id_articolo;
    }

    /**
     * @return the id_autore
     */
    public int getId_autore() {
        return id_autore;
    }

    /**
     * @param id_autore the id_autore to set
     */
    public void setId_autore(int id_autore) {
        this.id_autore = id_autore;
    }

    /**
     * @return the voto
     */
    public int getVoto() {
        return voto;
    }

    /**
     * @param voto the voto to set
     */
    public void setVoto(int voto) {
        this.voto = voto;
    }

    /**
     * @return the commaut
     */
    public String getCommaut() {
        return commaut;
    }

    /**
     * @param commaut the commaut to set
     */
    public void setCommaut(String commaut) {
        this.commaut = commaut;
    }

    /**
     * @return the commorg
     */
    public String getCommorg() {
        return commorg;
    }

    /**
     * @param commorg the commorg to set
     */
    public void setCommorg(String commorg) {
        this.commorg = commorg;
    }
}
