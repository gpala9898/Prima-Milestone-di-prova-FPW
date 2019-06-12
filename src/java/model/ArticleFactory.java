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

/*Creo una classe articolo Factory con la funzione di contenere i dati 
fittizi di determinati articoli collegati all'utente che sta usando la pagina*/

public class ArticleFactory {
    private static ArticleFactory singleton;
    private ArticleFactory(){
    }
        public static ArticleFactory getInstance(){
            if(singleton==null){
                singleton = new ArticleFactory();
            }
            return singleton;
        }
        
        public List<Article> getArticle() throws SQLException{
        List<Article> articoli = new ArrayList<>();
        
        try {
            Connection conn = DbManager.getInstance().getDbConnection();
            Statement stmt1 = conn.createStatement();
            Statement stmt2 = conn.createStatement();
            String sql1 = "SELECT * FROM articolo";
            String sql2 = "SELECT * FROM articolo JOIN modart ON modart.id_art = articolo.id_articolo "
                    + "JOIN utente ON utente.id_utente = modart.id_aut ORDER BY articolo.id_articolo"; 
            ResultSet set1 = stmt1.executeQuery(sql1);
            ResultSet set2 = stmt2.executeQuery(sql2);
            while (set1.next()) {
                Article articolo = new Article();
                articolo.setId_articolo(set1.getInt("id_articolo"));
                articolo.setTitolo(set1.getString("titolo"));
                List<Utente> utenti = new ArrayList<>();

                while (set2.next()) {
                    if (set1.getInt("id_articolo") == set2.getInt("id_articolo")) {
                        Utente utente = new Utente();
                        utente.setId(set2.getInt("id_utente"));
                        utente.setNome(set2.getString("nome"));
                        utente.setCognome(set2.getString("cognome"));
                        utente.setImmagine(set2.getString("immagine"));
                        utente.setEmail(set2.getString("email"));
                        utente.setPassword(set2.getString("password"));
                        utente.setEnte(set2.getString("ente"));
                        utenti.add(utente);
                    }
                }
                articolo.setUtente(utenti);

                articolo.setData(set1.getString("data"));
                articolo.setImmagine(set1.getString("immagine"));
                articolo.setTesto(set1.getString("testo"));
                articolo.setSituazione(set1.getString("situazione"));
                articoli.add(articolo);
            }

            stmt1.close();
            stmt2.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return articoli;
    }
       
    public List<Article> getArticleAutore(Utente utente) throws SQLException{
        List<Article> articleAuthor = new ArrayList<>();
        try {
            Connection conn = DbManager.getInstance().getDbConnection();
            String sql = "select * from articolo join modart on articolo.id_articolo=modart.id_art"
                    + " join utente on utente.id_utente=modart.id_aut where modart.id_aut=?";

            
            PreparedStatement stmt1 = conn.prepareStatement(sql);
            PreparedStatement stmt2 = conn.prepareStatement(sql);
            stmt1.setInt(1,utente.getId());
            stmt2.setInt(1,utente.getId());
            
            ResultSet set1 = stmt1.executeQuery();
            ResultSet set2 = stmt2.executeQuery();
            
            while (set1.next()) {
                Article articolo = new Article();
                articolo.setId_articolo(set1.getInt("id_articolo"));
                articolo.setTitolo(set1.getString("titolo"));
                List<Utente> utenti = new ArrayList<>();

                while (set2.next()) {
                    if (set1.getInt("id_articolo") == set2.getInt("id_articolo")) {
                        utente.setId(set2.getInt("id_utente"));
                        utente.setNome(set2.getString("nome"));
                        utente.setCognome(set2.getString("cognome"));
                        utente.setImmagine(set2.getString("immagine"));
                        utente.setEmail(set2.getString("email"));
                        utente.setPassword(set2.getString("password"));
                        utente.setEnte(set2.getString("ente"));
                        utenti.add(utente);
                    }
                }
                articolo.setUtente(utenti);

                articolo.setData(set1.getString("data"));
                articolo.setImmagine(set1.getString("immagine"));
                articolo.setTesto(set1.getString("testo"));
                articolo.setSituazione(set1.getString("situazione"));
                articleAuthor.add(articolo);
            }

            stmt1.close();
            stmt2.close();
            conn.close();
        }catch (SQLException ex) {
            Logger.getLogger(DbManager.class.getName()).
                    log(Level.SEVERE, null, ex);
        } 
        return articleAuthor;
    }
            
            /*while (set.next()) {
                Article articolo = new Article();
                articolo.setId_articolo(set.getInt("id_articolo"));
                articolo.setTitolo(set.getString("titolo"));
                articolo.setTesto(set.getString("testo"));
                articolo.setData(set.getString("data"));
                articolo.setSituazione(set.getString("situazione"));
                articolo.setImmagine(set.getString("immagine"));
                articleAuthor.add(articolo);
            }
            stmt.close();
            conn.close();

        } catch (SQLException ex) {
            Logger.getLogger(DbManager.class.getName()).
                    log(Level.SEVERE, null, ex);
        } return articleAuthor;

    }*/
        /*for(Article a : allArticles){
            for(Utente u1 : a.getUtente()){
                if(u1.equals(u)){
                    articleAuthor.add(a);
                }
            }
        }
        
        return articleAuthor;
    }
        */
    
    public int insertArticolo(Article articolo) {
        int pid = 0;
        
        try {
            Connection conn = DbManager.getInstance().getDbConnection();
            Statement stmt = conn.createStatement();
            String sql = "INSERT INTO articolo (id_articolo) "
                    + "VALUES (default)"; //aggiungere un join per gli autori

            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet set = stmt.getGeneratedKeys();
            if (set.next()) {
                pid = set.getInt(1);
            }

            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return pid;
    }
    
    
    public int maxIdArt() {
        try {
            Boolean LoggedIn;
            int max = 0;
            Connection conn = DbManager.getInstance().getDbConnection();

            String sql = "select max(id_articolo) id_articolo from articolo";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            LoggedIn = set.next();
            if (LoggedIn) {
                max = set.getInt(1);
            }

            stmt.close();
            conn.close();
            return max;
        } catch (SQLException ex) {
            // nel caso la query fallisca (p.e. errori di sintassi)
            // viene sollevata una SQLException
            Logger.getLogger(DbManager.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    
    public void saveArticle(Article articolo) throws SQLException {
        try{
        Connection conn = DbManager.getInstance().getDbConnection();
           String sql = "update articolo set titolo=?, testo=?,data=?,immagine=? where id_articolo=?";
            
           PreparedStatement stmt = conn.prepareStatement(sql);
           stmt.setString(1, articolo.getTitolo());
           stmt.setString(2, articolo.getTesto());
           stmt.setString(3, articolo.getData());
           stmt.setString(4, articolo.getImmagine());
           stmt.setInt(5, articolo.getId_articolo());
            
           stmt.executeUpdate();
            
            stmt.close();
            conn.close();

        } catch (SQLException ex) {
            Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Article getArticleId(int id) throws SQLException {

        try {
            Connection conn = DbManager.getInstance().getDbConnection();
            
            String sql = "SELECT * FROM articolo JOIN modart ON "
                    + "modart.id_art = articolo.id_articolo "
                    + "JOIN utente ON utente.id_utente = modart.id_aut WHERE id_articolo = ?"; 

            PreparedStatement stmt1 = conn.prepareStatement(sql);
            stmt1.setInt(1, id);
            PreparedStatement stmt2 = conn.prepareStatement(sql);
            stmt2.setInt(1, id);

            ResultSet set1 = stmt1.executeQuery();
            ResultSet set2 = stmt2.executeQuery();
            while (set1.next()) {
                Article articolo = new Article();
                articolo.setId_articolo(set1.getInt("id_articolo"));
                List<Utente> utenti = new ArrayList<>();

                while (set2.next()) {
                    if (set1.getInt("id_articolo") == set2.getInt("id_articolo")) {
                        Utente utente = new Utente();
                        utente.setId(set2.getInt("id_utente"));
                        utente.setNome(set2.getString("nome"));
                        utente.setCognome(set2.getString("cognome"));
                        utente.setImmagine(set2.getString("immagine"));
                        utente.setEmail(set2.getString("email"));
                        utente.setPassword(set2.getString("password"));
                        utente.setEnte(set2.getString("ente"));
                        utenti.add(utente);
                    }
                }
                articolo.setUtente(utenti);

                articolo.setTitolo(set1.getString("titolo"));
                articolo.setData(set1.getString("data"));
                articolo.setImmagine(set1.getString("immagine"));
                articolo.setTesto(set1.getString("testo"));
                articolo.setSituazione(set1.getString("situazione"));

                return articolo;
            }

            stmt1.close();
            stmt2.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UtenteFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
