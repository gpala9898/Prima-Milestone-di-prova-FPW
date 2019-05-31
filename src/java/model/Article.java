/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gianluca
 */

/*Creo una clsse Articolo che conterrà gli elementi che mi servono in fase di 
visualizzazione che saranno collegati all'utente che verrà mostrato dopo il login*/

public class Article {

    
    private int id_articolo;
    private List<Utente> utente;
    private String titolo;
    private String data;
    private String situazione;
    private String testo;
    private String immagine;
    
    
    public Article(){
        this.utente = new ArrayList<>();
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
     * @return the utente
     */
    public List<Utente> getUtente() {
        return utente;
    }

    /**
     * @param utente the utente to set
     */
    public void setUtente(List<Utente> utente) {
        this.utente = utente;
    }

    /**
     * @return the titolo
     */
    public String getTitolo() {
        return titolo;
    }

    /**
     * @param titolo the titolo to set
     */
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    /**
     * @return the data
     */
    public String getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(String data) {
        this.data = data;
    }

    /**
     * @return the situazione
     */
    public String getSituazione() {
        return situazione;
    }

    /**
     * @param situazione the situazione to set
     */
    public void setSituazione(String situazione) {
        this.situazione = situazione;
    }

    /**
     * @return the testo
     */
    public String getTesto() {
        return testo;
    }

    /**
     * @param testo the testo to set
     */
    public void setTesto(String testo) {
        this.testo = testo;
    }

    /**
     * @return the immagine
     */
    public String getImmagine() {
        return immagine;
    }

    /**
     * @param immagine the immagine to set
     */
    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }
    
}
    