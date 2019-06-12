<%-- 
    Document   : scriviArticolo
    Created on : 6-mag-2019, 9.58.52
    Author     : Gianluca
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Modifica Articolo</title>
        <meta charset="UTF-8">
        <meta name="author" content="Gianluca Pala">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">  
        
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery.js"></script> 
        <script src="js/author.js"></script>
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

    <a type="submit" id="button" href="logout.html?logout=true">LOGOUT</a>                                            

    <br/>
    <br/>
    
</aside>
    <form action="scriviArticolo.html?pid=${articoli.getId_articolo()}" method="post">
            
        <!--Se l'ID dell'articolo è diverso da null la pagina si chiamerà modifica
        articolo, altrimenti la pagina si chiamerà SCRIVI ARTICOLO e mostrerà tutti
        i campi compilati-->
            <table class="tabellamodart">               
                        <tr>
                            <th><c:choose>
                                    <c:when test="${articoli.getId_articolo() != null}">
                                        <b>MODIFICA ARTICOLO (ID:${articoli.getId_articolo()})</b>   
                                    </c:when>  
                                    <c:otherwise>
                                        <b>SCRIVI ARTICOLO</b>  
                                    </c:otherwise>  
                                </c:choose></th>                           
                        </tr>
                        <tr class="rigadispari">
                            <td><label><em>Titolo Articolo</em></label>
                            <input type="text" name="titolo" id="titolo" value="${articoli.getTitolo()}"/></td>                       
                        </tr>       
                        
                        <tr class="rigapari">
                            <td><label><em>Scegli Autore</em></label><br>
                                <ul id="naut">
                                    <c:forEach items="${articoli.getUtente()}" var="utente">
                                        <li>${utente.getNome()}, ${utente.getCognome()} (${utente.getId()})</li>
                                        </c:forEach>
                                </ul>
                                <input type="text" name="author" value="" placeholder="Cerca Autore" id="author"/> 
                                    <button type="submit" class="addaut" name="addAuthor">
                                        <img src="img/add.png"/>
                                <div id="inautori">
                                    
                                </div>
                            </td>
                        </tr>
                        
                        <tr class="rigadispari">
                            
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
                        
                        <tr class="rigapari">
                            
                            <!--Riga per l'inserimento dell'immagine-->
                            <td><label><em>Url Immagine</em></label><br>
                        <input type="url" name="img" id="immagine" value="${articoli.getImmagine()}"/>                              
                            </td>                                                    
                        </tr>
                        
                        <tr class="rigadispari">
                            <td><label><em>Data</em></label><br>
                                <input type="text" name="data" value="${articoli.getData()}"/></td>                        
                        </tr>
                        
                        <tr class="rigapari">
                            <td><label><em>Testo</em></label><br/>
            <textarea id="testo" name="testo" rows="5" cols="60">${articoli.getTesto()}</textarea>
            <input type="hidden" name="lid" value="${articoli.getId_articolo()}"><br/></td>                                  
                        </tr>                                                           
                    </table>
                        <br/>
                <!--Il bottone comparirà solo nel caso in cui l'articolo si trovi
                in uno stato aperto-->
                        <c:choose>
                            <c:when test="${articoli.getSituazione()== null}">                          
                                <input type="submit" id="salvaarticolo" name="salvaart" value="Salva"/> 
                            </c:when>
                        </c:choose>
                                <c:choose>
                                    <c:when test="${articoli.getSituazione()== 'Aperto'}">                          
                                        <input type="submit" id="salvaarticolo" name="salvaart" value="Modifica"/> 
                                    </c:when>
                                </c:choose>
        </form>
                </div>
                    
                <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
