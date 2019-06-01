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
    
        public List<Utente> getUtenti()throws SQLException {
        List<Utente> utenti = new ArrayList<>();
        
        try {
            Connection conn = DbManager.getInstance().getDbConnection();
            Statement stmt = conn.createStatement();
            String sql = "select * from utente";
            ResultSet set = stmt.executeQuery(sql);
            while (set.next()) {
                Utente utente = new Utente();
                utente.setId(set.getInt("id_utente"));
                utente.setNome(set.getString("nome"));
                utente.setCognome(set.getString("cognome"));
                utente.setEmail(set.getString("email"));
                utente.setPassword(set.getString("password"));
                utente.setEnte(set.getString("ente"));
                utente.setImmagine(set.getString("immagine"));
                utente.setTipo(set.getString("tipo"));
                utenti.add(utente);
            }

            stmt.close();
            conn.close();
        return utenti;

        } catch (SQLException ex) {
            Logger.getLogger(DbManager.class.getName()).
                    log(Level.SEVERE, null, ex);
        } return null;

    }

    
    /*Ordina l'utente in base al proprio ID*/
    public Utente getUtenteById(int id) throws SQLException {
       try {
            Boolean loggedIn;

            Connection conn = DbManager.getInstance().getDbConnection();
            String sql = "select * from utente where id_utente=?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1,id);

            ResultSet set = stmt.executeQuery();

            loggedIn = set.next(); 
            if (loggedIn) {
                Utente utente = new Utente();
                utente.setId(set.getInt("id_utente"));
                utente.setNome(set.getString("nome"));
                utente.setCognome(set.getString("cognome"));
                utente.setEmail(set.getString("email"));
                utente.setPassword(set.getString("password"));
                utente.setEnte(set.getString("ente"));
                utente.setImmagine(set.getString("immagine"));
                utente.setTipo(set.getString("tipo"));
                stmt.close();
                conn.close();
                return utente;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    /*Ordina l'utente in base alla propri Mail e Password*/
    public Utente getUtenteByEmailPassword(String email, String password)
    throws SQLException{
        try {
            Boolean loggedIn;

            Connection conn = DbManager.getInstance().getDbConnection();
            String sql = "select * from utente where email = ? and password = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet set = stmt.executeQuery();

            loggedIn = set.next(); 
            if (loggedIn) {
                Utente utente = new Utente();
                utente.setId(set.getInt("id_utente"));
                utente.setNome(set.getString("nome"));
                utente.setCognome(set.getString("cognome"));
                utente.setEmail(set.getString("email"));
                utente.setPassword(set.getString("password"));
                utente.setEnte(set.getString("ente"));
                utente.setImmagine(set.getString("immagine"));
                utente.setTipo(set.getString("tipo"));
                stmt.close();
                conn.close();
                return utente;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    
public Boolean deleteAutore(int id){
        Connection conn = null;
        try {
           conn = DbManager.getInstance().getDbConnection();

            conn.setAutoCommit(false);

            String sql = "DELETE FROM valutazione WHERE id_autore = ?";
            String sql2 = "DELETE * FROM articolo INNER JOIN modart ON id_art = id_articolo WHERE  id_aut= ?";
            String sql3 = "DELETE FROM utente WHERE id_utente = ?";
            
            PreparedStatement stmt1 = conn.prepareStatement(sql);
            stmt1.setInt(1, id);
            stmt1.executeUpdate();
            
            PreparedStatement stmt2 = conn.prepareStatement(sql2);
            stmt2.setInt(1, id);
            stmt2.executeUpdate();
            
            PreparedStatement stmt3 = conn.prepareStatement(sql3);
            stmt3.setInt(1, id);
            stmt3.executeUpdate();
            
            conn.commit();
            conn.setAutoCommit(true); //Per completezza
            stmt1.close();
            stmt2.close();
            stmt3.close();
            conn.close();
            
        } catch (SQLException e) {
            Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, null, e);
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            return false;

        }
        return true;
    }
}
