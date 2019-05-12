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
import javax.servlet.http.HttpSession;
import model.Utente;
import model.UtenteFactory;
import model.Article;
import model.ArticleFactory;

/**
 *
 * @author Gianluca
 */
@WebServlet(name = "Login", urlPatterns = {"/login.html"})
public class Login extends HttpServlet {

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
        
        
        HttpSession session = request.getSession();
        
        if(request.getParameter("accedi") != null){
            /*Quando premo il pulsante accedi richiederà email e password e andrà
            a verificare che i dati inseriti siano presenti*/
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Utente utente = UtenteFactory.getInstance().getUtenteByEmailPassword(email, password);
            
            if(utente != null){
                session.setAttribute("utenteId", utente.getId());
            }
            /*Se l'utente è non è presente verrà indirizzato all pagina di registrazione*/
            else{
                request.getRequestDispatcher("registrazione.html").forward(request, response); 
            }
        }
        
        /*Qui ho l'utenteId che è stato inizializzato (adesso o precedentemente)*/
        
        if(session.getAttribute("utenteId") != null){
            int utenteId = (int) session.getAttribute("utenteId");
            Utente utente = UtenteFactory.getInstance().getUtenteById(utenteId);
        /*Qui verifico che l'utente che si è loggato sia un organizzatore, se lo è
            il login rimanderà alla pagina di gestione*/
        if(utente.getTipo() == "organizzatore"){
            List<Article> articoli = ArticleFactory.getInstance().getArticle();
           request.setAttribute("utente", utente);
           request.setAttribute("articoli", articoli);
           request.getRequestDispatcher("gestione.jsp").forward(request, response); 
        }    
            List<Article> articoli = ArticleFactory.getInstance().getArticleAutore(utente);
            
            /*Alla jsp verrà passata una variabile utente e articoli, con un valore 
            riferito all'oggetto utente e articoli della Servlet*/
            
            request.setAttribute("utente", utente);
            request.setAttribute("articoli", articoli);
            /*Carico la jsp articoli se non si tratta di un organizzatore*/
            request.getRequestDispatcher("articoli.jsp").forward(request, response);
        }else{
            //altrimenti torno alla pagina di login
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
