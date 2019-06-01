/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Article;
import model.ArticleFactory;
import model.Utente;
import model.UtenteFactory;
/**
 *
 * @author Gianluca
 */

@WebServlet(name = "ModificaArticolo", urlPatterns = {"/scriviArticolo.html"})
public class ModificaArticolo extends HttpServlet{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        
        if(session.getAttribute("utenteId") != null){
           int utenteId = (int) session.getAttribute("utenteId");
           Utente utente =UtenteFactory.getInstance().getUtenteById(utenteId);
           if(utente.getTipo().equals("autore")){
            request.setAttribute("utente",utente);
            int pid = Integer.parseInt(request.getParameter("pid"));
            Article articoli = ArticleFactory.getInstance().getArticleId(pid);
            
            /*Alla jsp passerò una variabile utente e articoli, con un valore 
            riferito all'oggetto utente e articoli della Servlet*/
            
            request.setAttribute("articoli", articoli);}
           else{
               request.getRequestDispatcher("error.jsp").forward(request, response);
           }
        }
        
        /*Se il parametro scriviarticolo non è nullo mostrerò la pagina scrivi 
        Articolo collegata all'articolo con l'ID richiesto*/
            if(request.getParameter("salvaart") != null){
            int pid = Integer.parseInt(request.getParameter("pid"));
            Article articoli = ArticleFactory.getInstance().getArticleId(pid);
            articoli.setTitolo(request.getParameter("titolo"));
            articoli.setTesto(request.getParameter("testo"));
            articoli.setData(request.getParameter("data"));
            articoli.setImmagine(request.getParameter("img"));
            
            ArticleFactory.getInstance().saveArticle(articoli);
            
            request.setAttribute("articoli", articoli);
            request.setAttribute("pid", pid);
            }
            //Carico la jsp scriviArticolo
            request.getRequestDispatcher("scriviArticolo.jsp")
                    .forward(request, response);            
            }
            
        
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ModificaArticolo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ModificaArticolo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
