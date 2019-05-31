/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "Manage", urlPatterns = {"/gestione.html"})
public class Manage extends HttpServlet {

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
        
        /*Se l'ID dell'utente è nullo torno al form di login (alla Servlet che lo 
        gestisce)*/
        if(request.getParameter("uid") == null){
            request.getRequestDispatcher("login.html").forward(request, response);
        } else {
            //Altrimenti richiedo l'Id dell'utente e verifico di che utente si tratta
            int uid = Integer.parseInt(request.getParameter("uid"));
            Utente utente = UtenteFactory.getInstance().getUtenteById(uid);

            request.setAttribute("utente", utente);

            /*Se l'utente che vuole accedere alla pagina di gestione è un autore
            visualizza la pagina di errore*/
            if (utente.getTipo().equals("autore"))
                request.getRequestDispatcher("error.jsp").forward(request, response);
            else{
                /*Altrimenti mostra la pagina di gestione*/
                List<Article> articoli = ArticleFactory.getInstance().getArticle();
                request.setAttribute("articoli", articoli);
                request.getRequestDispatcher("gestione.jsp").forward(request, response);
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
            Logger.getLogger(Manage.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Manage.class.getName()).log(Level.SEVERE, null, ex);
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
