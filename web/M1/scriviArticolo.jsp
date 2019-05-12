<%-- 
    Document   : scriviArticolo
    Created on : 30-apr-2019, 13.46.34
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ScriviArticolo</title>
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
                    
                    <!--Tabella per la creazione dell'articolo con i vari elementi
                suddivisi in righe pari e dispari per poter cambiare i colori con css
                per una miglior visualizzazione-->

                    <form action="articoli.jsp" method="post">
                        <table class="tabellaSA">
                            <tr>
                                <th><b>SCRIVI ARTICOLO</b></th>                           
                            </tr>
                            <tr class="rigadispari">
                                <td><label><em>Titolo Articolo</em></label>
                                    <input type="text" name="titolo" id="titolo" value=""/></td>

                            </tr>
                            <tr class="rigapari">
                                <td><label><em>Aggiungi Autore</em></label><br>
                                    <input type="text" name="AA" value=""/></td>                                                    
                            </tr>

                            <tr class="rigadispari">
                                <td><label><em>Scegli Autore</em></label><br>
                                    <select>
                                        <option value="">Seleziona Autore</option>
                                        <option value="a1">Bartolomeo Buscema</option>
                                        <option value="a2">Gabriella Bernardi</option>
                                        <option value="a3">Ugo Apollonio</option>
                                    </select></td>                                                  
                            </tr>

                            <tr class="rigapari">

                                <!--Checkbox per la scelta multipla della categoria 
                                di articolo-->

                                <td><label><em>Categorie</em></label>
                            <center><table>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="tipo"> Internet<br>                                                                                      
                                            <input type="checkbox" name="tipo"> Robotica<br>
                                        </td> 

                                        <td>
                                            <input type="checkbox" name="tipo"> Recensione <br>
                                            <input type="checkbox" name="tipo"> HTML <br>                              
                                        </td>

                                        <td>
                                            <input type="checkbox" name="tipo"> Programmazione <br> 
                                            <input type="checkbox" name="tipo"> Sicurezza Informatica <br>
                                        </td>
                                    </tr>
                                </table></center></td>                           
                            </tr>

                            <tr class="rigadispari">

                                <!--Riga per l'inserimento dell'immagine-->
                                <td><label><em>Url Immagine</em></label><br>
                                    <input type="url" name="img" id="immagine" value=""/>                              
                                </td>                                                    
                            </tr>

                            <tr class="rigapari">
                                <td><label><em>Data</em></label><br>
                                    <input type="date"/></td>                        
                            </tr>

                            <tr class="rigadispari">
                                <td><label><em>Testo Articolo</em></label><br>
                                    <textarea name="testo" rows="14" cols="95"></textarea><br></td>
                            </tr>
                        </table>
                        <!--_____________________________________________-->
                        <br> 

                        <!--Pulsante per il salvataggio dell'articolo-->

                        <nav class="tasto">
                            <input type="submit" value="SALVA ARTICOLO "/>             
                        </nav>
                    </form>
                </div>           
                <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>

    </body>
</html>
