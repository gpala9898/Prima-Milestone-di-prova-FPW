<%-- 
    Document   : gestione
    Created on : 10-mag-2019, 10.30.53
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <!--Pagina per la gestione degli articoli da parte di un eventuale
        organizzatore-->
        <title>Gestione</title>
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
                            <!--Messaggio di benvenuto per l'organizzatore-->
                            <p> Benvenuto, Gestore
                                ${utente.getNome()} ${utente.getCognome()}! </p>

                            <!--Collegamento alla pagina di login nel caso in cui
                            venga premuto il tasto di logout-->
                            <a type="submit" id="button" href="logout.html?logout=true">LOGOUT</a>                                            

                        </aside>
                    
                    <table class="tabella">
                        <tr>
                            <th>Data</th>
                            <th>Titolo</th>
                            <th>#Valutazioni</th>
                            <th>Decisione</th>
                        </tr>
                          <c:forEach items="${articoli}" var="articoli">
                              <tr class="rigadispari">
                                  <td>${articoli.getData()}</td>
                                  <td>${articoli.getTitolo()}</td>
                                  <td>
                                      <c:choose><c:when test="${articoli.getSituazione()=='Da valutare'}">
                                              <a href="gestione.html">Scegli Valutatori</a>
                                          </c:when>
                                          <c:otherwise>
                                              ${articoli.getnValutatori()}/3
                                          </c:otherwise>
                                      </c:choose>
                                  </td>
                                  
                                  <td>
                                      <c:choose><c:when test="${articoli.getSituazione()=='Aperto'}">
                                              <a href="gestione.html">Decidi</a>
                                          </c:when>
                                          <c:otherwise>
                                              ${articoli.getSituazione()}
                                          </c:otherwise>
                                      </c:choose>
                                      </td>          
                            </tr>
                        </c:forEach>                                         
                    </table>
                    </div>
                                <!--Qui includo il mio footer-->
                                <jsp:include page="footer.jsp"/>
                    
    </body>
</html>
