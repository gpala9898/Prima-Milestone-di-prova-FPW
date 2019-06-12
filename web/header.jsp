<%-- 
    Document   : header
    Created on : 30-apr-2019, 13.22.21
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header clearfix">
            <a class="header_logo"><p style="font-family: arial">Free Peer Review</p></a>
   
            <!--Barra di navigazione dinamica in base al tipo di utente che
            decide di loggarsi-->
            
            <ul class="header_menu">
                <!--Se l'utente loggato è un organizzatore visualizza solo il 
                collegamento alla pagina di gestione (oltre alla pagina di aiuto)-->
                        <c:choose>
                                <c:when test="${utente.getTipo()=='organizzatore'}">
                                    <li class="header_menu_el"><a href="gestione.html?uid=${utente.getId()}">
                                        <p style="font-family: arial">Gestione</p></a> 
                                    </li></c:when>
                        </c:choose>
                
                <!--Se l'utente loggato è un autore visualizza i collegamenti
                alla pagina di profilo, articoli e valutazioni(oltre alla pagina di aiuto)-->
                               <c:choose>
                                   <c:when test="${utente.getTipo()=='autore'}"> 
                <li class="header_menu_el"><a href="articoli.html?pid="><p style="font-family: arial">Articoli</p></a></li>
                <li class="header_menu_el"><a href=""><p style="font-family: arial">Valutazioni</p></a></li>
                <li class="header_menu_el"><a href="registrazione.html"><p style="font-family: arial">Profilo</p></a></li>
                                   </c:when>
                               </c:choose>
                <!--Se l'utente non è loggato mostra solo il collegamento alla pagina
                di login-->
                    <c:choose>
                        <c:when test="${utente==null}">
                        <li class="header_menu_el"><a href="login.html"><p style="font-family: arial">Login</p></a></li>
                    </c:when>
                </c:choose> 
                <li class="header_menu_el"><a href="https://www.google.com/"><p style="font-family: arial">Serve aiuto ?</p></a></li>
                
            </ul>
            <script src="js/jquery.js"></script> 
        </header>
