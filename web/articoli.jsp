<%-- 
    Document   : articoli
    Created on : 30-apr-2019, 13.41.50
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Articoli</title>
        <meta charset="UTF-8">
        <meta name="author" content="Gianluca Pala">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        <!--Qui includo il mio header-->
        <jsp:include page="header.jsp"/>
        <!--Creazione cover della pagina di sfondo per l'inserimento degli 
            elementi della pagina-->
        
            <div id="Sfondo_nero"></div>            
                <div class="main_content">
                    
                    <aside class="profilo">
                        
    <!--Messaggio di benvenuto-->               
    <p>Benvenuto, ${utente.getNome()} ${utente.getCognome()}!</p>

    <a type="submit" id="button" href="logout.html?logout=true">LOGOUT</a>                                            
    <br>
    <br>
    <!--Visualizza gli articoli che non sono da valutare di quel determinato autore-->
        <c:choose>
            <c:when test="${utente.getTipo()=='autore'}">
                <strong><h4>I miei Articoli</h4></strong>
                        <ul><c:forEach items="${articoli}" var="articoli">                               
                                <c:choose>
                                    <c:when test="${articoli.getSituazione()!='Da valutare'}">
                            <li>
                                <a href="scriviArticolo.html?pid=${articoli.getId()}&mid=${utente.getId()}">
                                    ${articoli.getTitolo()}
                                </a>
                            </li></c:when>
                                </c:choose>
                        </c:forEach></ul>
            <!--Visualizza gli articoli che sono da valutare di quel determinato autore-->    
                <strong><h4>Da Valutare</h4></strong>
                        <ul><c:forEach items="${articoli}" var="articolo">
                                <c:choose>
                                    <c:when test="${articolo.getSituazione()=='Da valutare'}">
                            <li>
                                <a href="">
                                    ${articolo.getTitolo()}
                                </a>
                            </li></c:when>
                                </c:choose>
                        </c:forEach></ul>
            </c:when>
        </c:choose>
    
</aside>
                    
    <!--Tabella per la visualizzazione degli articoli con i vari elementi.
    Articoli ordinati dal più recente al più vecchio.Create diverse colonne per
    suddividere gli articoli per caratteristiche. Per gli articoli in stato aperto
    visualizza il bottone per modificare l'articolo collegato alla servlet modificaArticolo
    e quello per la cancellazione non funzionante. Per gli articoli in valutazione
    visualizza solo il bottone per la cancellazione-->    
                
                    <table class="tabella">
                        <tr>
                            <th>Data</th>
                            <th>Titolo</th>
                            <th>Situazione</th>
                            <th>Azione</th>
                        </tr>
                          <c:forEach items="${articoli}" var="articoli">
                              <tr class="rigadispari">
                                  <td>
                                      ${articoli.getData()}</td>
                                  <td>
                                      ${articoli.getTitolo()}
                                  </td>

                                  <td>${articoli.getSituazione()}</td>
                            <td>
                                    <c:choose>
                                        <c:when test="${articoli.getSituazione()=='Aperto'}"> 
                                        <a href="scriviArticolo.html?pid=${articoli.getId()}&mid=${utente.getId()}">
                                            <button class="edit" type="submit"><img src="img/edit.png" width="25" height="25" alt="edit"></button>
                                        </a>
                                        </c:when>
                                    </c:choose>
                                <c:choose>
                                    <c:when test="${articoli.getSituazione()=='Aperto' or articoli.getSituazione()=='Da valutare'}">
                                        <button class="remove" type="submit"><img src="img/remove.png" width="25" height="25" alt="remove"></button>                         
                                    </c:when>
                                </c:choose>
                                </td>
                            </tr>
                        </c:forEach>                                         
                    </table>
                    <br>
                    <!--Pulsante di collegamento alla pagina di creazione di un 
                    nuovo articolo (NON FUNZIONANTE NON RIMANDA A NIENTE)-->  
                    <form action="" method="post">
                    <nav class="tasto">
                    <input type="submit" value="NUOVO ARTICOLO "/>             
                    </nav></form>
                </div>
            <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
            
    </body>
</html>
