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
import model.Article;
import model.ArticleFactory;
import model.Utente;
import model.UtenteFactory;
/**
 *
 * @author Gianluca
 */

@WebServlet(name = "ModificaArticolo", urlPatterns = {"/scriviArticolo.html"})
public class ModificaArticolo extends HttpServlet {

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
        
        //Se l'ID dell'account da modificare è nullo torno al form di login
        if(request.getParameter("mid") == null){
            request.getRequestDispatcher("login.html").forward(request, response);
        }else{
            
            if(request.getParameter("pid") == null){
            
        /*Se il parametro scriviarticolo non è nullo mostreroò la pagina scrivi 
        Articolo collegata all'articolo con l'ID richiesto*/
            if(request.getParameter("scriviarticolo") != null){             
            int mid = Integer.parseInt(request.getParameter("mid"));
            Utente utente = UtenteFactory.getInstance().getUtenteById(mid);
            
            request.setAttribute("utente", utente);
            request.getRequestDispatcher("scriviArticolo.jsp").forward(request, response);
            }else
                //Altrimenti andrà alla pagina di errore
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            else{
            
            int pid = Integer.parseInt(request.getParameter("pid"));
            int mid = Integer.parseInt(request.getParameter("mid"));
            Article articoli = ArticleFactory.getInstance().getArticleId(pid);
            
            Utente utente = UtenteFactory.getInstance().getUtenteById(mid); 
            
            /*Alla jsp passerò una variabile utente e articoli, con un valore 
            riferito all'oggetto utente e articoli della Servlet*/
            
            request.setAttribute("utente",utente);
            request.setAttribute("articoli", articoli); 
            //Carico la jsp scriviArticolo
            request.getRequestDispatcher("scriviArticolo.jsp")
                    .forward(request, response);
        }
    }
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
