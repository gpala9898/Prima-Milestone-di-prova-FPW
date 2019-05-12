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

/*Creo una classe utente Factory con la funzione di contenere i metodi e i dati 
fittizi assegnati al tipo di utente che utilizza la pagina*/
public class UtenteFactory {
    
    private static UtenteFactory singleton;
    
    private UtenteFactory(){
    }
        public static UtenteFactory getInstance(){
            if(singleton==null){
                singleton = new UtenteFactory();
            }
            return singleton;
        }
    
        public List<Utente> getUtenti(){
        List<Utente> utenti = new ArrayList<>();
        
        Utente gianluca = new Utente();
        gianluca.setId(1);
        gianluca.setNome("Gianluca");
        gianluca.setCognome("Pala");
        gianluca.setEmail("gianlucapala98@gmail.com");
        gianluca.setPassword("Milestone19");
        gianluca.setEnte("http://facolta.unica.it/ingegneriainformatica/");
        gianluca.setImmagine("http://www.balooa.com/img/icon-registra-utente.jpg?m=1398631416");
        gianluca.setTipo("autore");
        utenti.add(gianluca);
        
        Utente bill = new Utente();
        bill.setId(2);
        bill.setNome("Bill");
        bill.setCognome("Gates");
        bill.setEmail("billgates55@outlook.com");
        bill.setPassword("SonoRicco");
        bill.setEnte("https://support.microsoft.com/it-it");
        bill.setImmagine("https://static.milanofinanza.it/content_upload/img/2018/02/201802190833455455/Gates-Bill-326203.jpg");
        bill.setTipo("organizzatore");
        utenti.add(bill);
        
        return utenti;
    }
    
    /*Ordina l'utente in base al proprio ID*/
    public Utente getUtenteById(int id){
        List<Utente> utente = this.getUtenti();
        for(Utente u : utente){
            if(u.getId() == id){
                return u;
            }
        }
        return null;
    }
    
    /*Ordina l'utente in base alla propri Mail e Password*/
    public Utente getUtenteByEmailPassword(String email, String password){
        List<Utente> utente = this.getUtenti();
        for(Utente u : utente){
            if(u.getEmail().equals(email) && u.getPassword().equals(password)){
                return u;
            }
        }
        return null;
    }
}