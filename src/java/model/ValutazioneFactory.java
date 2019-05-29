/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Gianluca
 */

/*Creo una Factory per valutazione dove inserirò dei dati fittizi*/
public class ValutazioneFactory {
    private static ValutazioneFactory singleton;
    
    private ValutazioneFactory(){}
    
    public static ValutazioneFactory getInstance(){
        if(singleton == null){
            singleton = new ValutazioneFactory();
        }
        return singleton;
    }

    /*Creo una lista di oggetti con valori inventati da poter essere richiamati
    nelle pagine dove servono*/
    public List<Valutazione> getValutazione() throws SQLException{
        List<Valutazione> valutazioni = new ArrayList<>();
        
        try {
            Connection conn = DbManager.getInstance().getDbConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from valutazione";
            ResultSet set = stmt.executeQuery(sql);
            while (set.next()) {
                Valutazione valutazione = new Valutazione();
                valutazione.setId_valutazione(set.getInt("id_valutazione"));
                valutazione.setId_articolo(set.getInt("id_articolo"));
                valutazione.setId_utente(set.getInt("id_utente"));
                valutazione.setVoto(set.getInt("voto"));
                valutazione.setCommaut(set.getString("commaut"));
                valutazione.setCommorg(set.getString("commorg"));
                valutazioni.add(valutazione);
            }

            stmt.close();
            conn.close();
        return valutazioni;

        } catch (SQLException ex) {
            Logger.getLogger(DbManager.class.getName()).
                    log(Level.SEVERE, null, ex);
        } return null;

    }
    
    public Valutazione getValutazioneByArticolo(int id) throws SQLException{

        try {
            Boolean loggedIn;

            Connection conn = DbManager.getInstance().getDbConnection();
            String sql = "select * from valutazione where id_articolo = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet set = stmt.executeQuery();

            loggedIn = set.next(); 
            if (loggedIn) {
                Valutazione valutazione = new Valutazione();
                valutazione.setId_valutazione(set.getInt("id_valutazione"));
                valutazione.setId_articolo(set.getInt("id_articolo"));
                valutazione.setId_utente(set.getInt("id_utente"));
                valutazione.setVoto(set.getInt("voto"));
                valutazione.setCommaut(set.getString("commaut"));
                valutazione.setCommorg(set.getString("commorg"));
            return valutazione;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    public Valutazione getValutazioneByUtente(int id) throws SQLException{

        try {
            Boolean loggedIn;

            Connection conn = DbManager.getInstance().getDbConnection();
            String sql = "select * from valutazione where id_utente = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet set = stmt.executeQuery();

            loggedIn = set.next(); 
            if (loggedIn) {
                Valutazione valutazione = new Valutazione();
                valutazione.setId_valutazione(set.getInt("id_valutazione"));
                valutazione.setId_articolo(set.getInt("id_articolo"));
                valutazione.setId_utente(set.getInt("id_utente"));
                valutazione.setVoto(set.getInt("voto"));
                valutazione.setCommaut(set.getString("commaut"));
                valutazione.setCommorg(set.getString("commorg"));
            return valutazione;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    public Boolean deleteValutazione(int idval,int id) {

        Connection conn = null;
        try {
            conn = DbManager.getInstance().getDbConnection();

            conn.setAutoCommit(false);

            String articolo = "DELETE FROM valutazione WHERE id_valutazione = ?";
            PreparedStatement stmt = conn.prepareStatement(articolo);
            stmt.setInt(1,idval);

            stmt.executeUpdate();

            String utente = "DELETE FROM valutazione WHERE id_utente = ?";

            stmt.setInt(1, id);
            stmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true); //Per completezza
            stmt.close();
            conn.close();
            
        } catch (SQLException e) {
            Logger.getLogger(UtenteFactory.class.getName()).log(Level.SEVERE, null, e);
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    Logger.getLogger(UtenteFactory.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return false;

        }
        return null;

    }
    
}
        
        /*Valutazione val1 = new Valutazione();
        val1.setId_valutazione(1);
        val1.setVoto(5);
        val1.setCommaut("Articolo ben strutturato");
        Article art1 = ArticleFactory.getInstance().getArticleId(1);              
        valutazioni.add(val1);
        
        
        Valutazione val2 = new Valutazione();
        val2.setId_valutazione(2);
        val2.setVoto(2);
        val2.setCommaut("Articolo poco interessante");
        Article art2 = ArticleFactory.getInstance().getArticleId(2);
        valutazioni.add(val2);
        
        return valutazioni;
    }
   
}*/
