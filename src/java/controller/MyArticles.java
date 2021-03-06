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
import javax.servlet.http.HttpSession;
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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        if(session.getAttribute("utenteId") != null){
        
            int uid = (int) session.getAttribute("utenteId");
            Utente utente = UtenteFactory.getInstance().getUtenteById(uid);
            request.setAttribute("utente", utente);

            
            if (utente.getTipo().equals("autore")) {
            List<Article> articoli = ArticleFactory.getInstance().getArticleAutore(utente);
            request.setAttribute("articoli", articoli);
            }
            if (request.getParameter("nuovo") != null) {
                Article articolo = new Article();
                int pid = ArticleFactory.getInstance().insertArticolo(articolo);
                
                response.sendRedirect("scriviArticolo.html?pid=" + pid);
            }
            else if(utente.getTipo().equals("organizzatore")) {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
             else {
                request.getRequestDispatcher("articoli.jsp").forward(request, response);
            }       
        }
    }
                /*Article articolo=new Article();
                ArticleFactory.getInstance().writeArticle(articolo);
               
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MyArticles.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MyArticles.class.getName()).log(Level.SEVERE, null, ex);
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
