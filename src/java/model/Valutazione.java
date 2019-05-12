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
    
    private int id;
    private int idcomment;
    private int voto;
    private String commaut;
    private String commorg;
    private int idarticolo;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the idcomment
     */
    public int getIdcomment() {
        return idcomment;
    }

    /**
     * @param idcomment the idcomment to set
     */
    public void setIdcomment(int idcomment) {
        this.idcomment = idcomment;
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

    /**
     * @return the idarticolo
     */
    public int getIdarticolo() {
        return idarticolo;
    }

    /**
     * @param idarticolo the idarticolo to set
     */
    public void setIdarticolo(int idarticolo) {
        this.idarticolo = idarticolo;
    }
}
