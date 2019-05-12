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
                        
    <p>Benvenuto, <em><strong>Gianluca</strong></em></p>

    <a id="button" href="../index.html">LOGOUT</a>                                            

    <br>
    <br>
    <br>

    <em><strong>I miei Articoli</strong></em>
    <ul>
        <li><a href="articoli.jsp">I robot a scuola</a></li>
        <li><a href="articoli.jsp">La protezione dei dati aiuta l'economia digitale</a></li>
        <li><a href="articoli.jsp">ASUS ROG Zephyrus S GX531, la recensione</a></li>

    </ul>

    <br>
    <br>

    <em><strong>Da Valutare</strong></em>
    <ul>
        <li><a href="articoli.jsp">I vantaggi dell'Intelligenza Artificiale</a></li>
        <li><a href="articoli.jsp">ADA, il braccio robot che aiuta a mangiare</a></li>
        <li><a href="articoli.jsp">Il carburante del futuro arriva dal mare</a></li>
    </ul>
</aside>
                    
    <!--Tabella per la visualizzazione degli articoli con i vari elementi
    suddivisi in righe pari e dispari per poter cambiare i colori con css
    per una miglior visualizzazione. Create diverse colonne per
    suddividere gli articoli per caratteristiche-->    
                
                    <table class="tabella">
                        <tr>
                            <th>Data</th>
                            <th>Titolo</th>
                            <th>Situazione</th>
                            <th>Azione</th>
                        </tr>
                        <tr class="dispari">
                            <td>07/03/2019</td>
                            <td>I robot a scuola</td>
                            <td id="azzurro1">Aperto</td>
                            <td><button><img src="../img/edit.png" width="25" height="25" alt="edit"></button>&nbsp;&nbsp;
                                &nbsp;&nbsp;<button><img src="../img/remove.png" width="25" height="25" alt="remove"></button></td>                        
                        </tr>
                        <tr class="pari">
                            <td>16/02/2019</td>
                            <td>La protezione dei dati aiuta l'economia mondiale</td>
                            <td id="azzurro2">Valutazione</td>
                            <td><button><img src="../img/remove.png" width="25" height="25" alt="delete"></button></td>                           
                        </tr>
                        <tr class="dispari">
                            <td>29/01/2019</td>
                            <td>ASUS ROG Zephyrus S GX531, la recensione</td>
                            <td id="verde">Accettato</td>
                            <td></td>                           
                        </tr>
                        
                        <tr class="pari">
                            <td>04/12/2018</td>
                            <td>Il carburante del futuro arriva dal mare</td>
                            <td id="rosso">Rifiutato</td>
                            <td></td>
                        </tr>                                            
                    </table>
                    <br>
                    
                    <!--Pulsante di collegamento alla pagina di creazione di un 
                    nuovo articolo-->
                    
                    <form action="scriviArticolo.jsp" method="post">
                    <nav class="tasto">
                    <input type="submit" value="NUOVO ARTICOLO "/>             
                    </nav></form>
                </div>
            <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
            
    </body>
</html>
