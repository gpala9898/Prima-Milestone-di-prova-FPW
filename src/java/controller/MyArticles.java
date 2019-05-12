/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Utente;
import model.UtenteFactory;
import model.Article;
import model.ArticleFactory;

/**
 *
 * @author Gianluca
 */

@WebServlet(name = "MyArticles", urlPatterns = {"/articoli.html"})
public class MyArticles extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //Se l'ID dell'utente è nullo andrà al form di Login
        if(request.getParameter("uid") == null){
            request.getRequestDispatcher("login.html").forward(request, response);
        }else{
            //Altrimenti verifica l'ID dell'utente
            int uid = Integer.parseInt(request.getParameter("uid"));
            Utente utente = UtenteFactory.getInstance().getUtenteById(uid);
            request.setAttribute("utente", utente);

            /*e verifica che si tratti di un autore, in quel caso mostrerà tutti 
            gli articoli di quell'autore nella jsp caricata*/
            if (utente.getTipo().equals("autore")) {
            List<Article> articoli = ArticleFactory.getInstance().getArticleAutore(utente);
            request.setAttribute("articoli", articoli);
            request.getRequestDispatcher("articoli.jsp").forward(request, response);
        }//In caso contrario darà errore
            else request.getRequestDispatcher("error.jsp").forward(request, response);           
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
        processRequest(request, response);
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
        processRequest(request, response);
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
