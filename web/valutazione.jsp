<%-- 
    Document   : valutazione
    Created on : 30-apr-2019, 13.46.34
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Valutazione</title>
        <meta charset="UTF-8">
        <meta name="author" content="Gianluca Pala">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">  
        
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery.js"></script> 
    </head>
    <body>
        <!--Qui includo il mio header-->
        <jsp:include page="header.jsp"/>
        <!--Creazione cover della pagina di sfondo per l'inserimento degli 
            elementi della pagina-->
        
            <div id="Sfondo_nero"></div>            
                <div class="main_content">
                    
                    <aside class="profilo">
                        
    <p>Benvenuto, ${utente.getNome()} ${utente.getCognome()}!</p>

    <a id="button" href="logout.html?logut=true">LOGOUT</a>                                            

    <br>
    <br>

    <!--La pagina non è f-->
        <c:choose>
            <c:when test="${utente.getTipo()=='autore'}">
                <h4>I miei Articoli</h4>
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
                
                <h4>Da Valutare</h4>
                        <ul><c:forEach items="${articoli}" var="articoli">
                                <c:choose>
                                    <c:when test="${articoli.getSituazione()=='Da valutare'}">
                            <li>
                                <a href="">
                                    ${articoli.getTitolo()}
                                </a>
                            </li></c:when>
                                </c:choose>
                        </c:forEach></ul>
            </c:when>
        </c:choose>
    
</aside>
                    
                    <!--Creazione tabella con un articolo di esempio con relativi
                   elementi di interesse (Titolo,Autore, Categoria/e e Data)-->
                    
                    
                    <table class="tabellaart">
                        <tr>
                            <th><h1>I vantaggi dell'Intelligenza Artificiale</h1>
                                <h2>Autore: Vincenzo Paduano</h2>
                                <h3>Categorie: Programmazione, Robotica</h3>
                                <h4>Data: 31/03/2019</h4>
                            </th>

                            <!--Immagine di copertina dell'articolo-->
                            <th><img src="img/AI.jpg" alt="AI"></th>

                        </tr>                        

                        <!--Corpo dell'articolo con stile giustificato-->
                        <tr class="dispari">
                            <td colspan="2"><p>Quando si parla di macchine pensanti 
                                    e futuro, non c'è dubbio che la
                                    letteratura di genere abbia una predilezione 
                                    per i soggetti distopici (lo stesso Asimov nei suoi 
                                    racconti metteva continuamente in evidenza le 
                                    falle delle tre leggi elencate sopra). 
                                    Senza contare che fior di scienziati
                                    stanno mettendo in guardia
                                    gli sviluppatori sui potenziali pericoli derivanti 
                                    dalle AGI una volta fuori dal nostro controllo diretto. 
                                    Reazioni di questo tipo sono comprensibili: 
                                    la paura dell'ignoto è parte della 
                                    nostra natura, ma è il caso di soffermarsi in 
                                    eguale misura sui numerosi e notevoli
                                    vantaggi portati dalle AI nelle nostre vite 
                                    e nell'evoluzione della società, 
                                    molti dei quali sono evidenti già nel presente.
                                </p></td>

                    </table>

                    <!--Creazione tabella con gli elementi per la valutazione 
                    dell'articolo e gli eventuali commenti per l'Autore e/o per
                    l'organizzatore (divisione per righe pari e dispari)-->

                    <form action="articoli.jsp" method="post">
                        <table class="tabellaval">
                            <tr>
                                <th colspan="2">VALUTAZIONE</th>                                                       
                            </tr>                        

                            <tr class="dispari">
                                <td colspan="2" ><p id="voto">
                                        Voto:
                                        <label>1</label>
                                        <input type="radio" name="voto">
                                        <label>2</label>
                                        <input type="radio" name="voto">
                                        <label>3</label>
                                        <input type="radio" name="voto">
                                        <label>4</label>
                                        <input type="radio" name="voto">
                                        <label>5</label>
                                        <input type="radio" name="voto">
                                    </p></td>
                            </tr>

                            <tr class="pari">
                                <td>
                                    Commenti per gli autori
                                    <textarea rows="8" cols="45"></textarea>                                                                                                          
                                </td>
                                <td>
                                    Commenti per gli organizzatori
                                    <textarea rows="8" cols="45"></textarea>                                                                                                          
                                </td>
                            </tr>    
                        </table>

                        <br>

                        <!--Pulsante per l'invio della valutazione e degli eventuali
                        commenti relativi all'articolo selezionato-->

                        <nav class="tasto">
                            <input type="submit" value="INVIA"/>             
                        </nav>
                    </form>
                </div>
                    
                <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
