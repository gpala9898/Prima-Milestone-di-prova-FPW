<%-- 
    Document   : profilo
    Created on : 30-apr-2019, 13.27.31
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <title>Profilo</title>
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
                    
                    <!--Creazione tabella con i dati del profilo utente con
                    i campi che ritrovo in fase di registrazione-->
                    
                    <form action="profilo.jsp" method="post">
                        <table class="tabellaprofilo">
                        <tr>
                            <th><img id="image" src="../img/images.png" alt="utente"></th>
                            <th><b>PROFILO</b></th>                             
                        </tr>
                        <tr class="rigadispari">
                            <td colspan="2"><label>Nome<br></label>
                        <input type="text" name="nome" id="Nome" value="Gianluca"/></td>
                           
                        </tr>
                        <tr class="rigapari">
                            <td colspan="2"><label>Cognome<br></label>
                        <input type="text" name="cognome" id="Cognome" value="Pala"/></td>
                                                  
                        </tr>
                        <tr class="rigadispari">
                            <td colspan="2"><label>Email<br></label>
                        <input type="text" name="Email" id="Email" value="gianlucapala98@gmail.com"/></td>
                                                     
                        </tr>
                        
                        <tr class="rigapari">
                            <td colspan="2"><label>Password<br></label>
                        <input type="password" name="password" id="Password" value="Passwordcomplicata98"/></td>
                                                     
                        </tr>
                        
                        <tr class="rigadispari">
                            <td colspan="2"><label>Ente<br></label>
                        <input type="url" name="Ente" id="Ente" value="http://facolta.unica.it/ingegneriarchitettura/"/></td>                        
                        </tr>
                        
                        <tr class="rigapari">
                            
                            <!--Form per l'inserimento dell'immagine-->
                            <td colspan="2">                               
                                Foto<br> <input type="url" name="immagine" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ97nynHETPkcHfpv-X_8-2yxyjRAeheGcsaCnVJv0jAi_qBc7PWg"/>
                                </td>                        
                        </tr>  
                        
                    </table>
                    <br>  
                    
                    <!--Pulsante per il salvataggio dei dati del profilo in caso
                    di eventuale modifica-->
                    
                    <nav class="azione">
                        <button type="submit" value="">SALVA</button><br><br>
                        <a href="profilo.jsp">Cancellati</a>
                    <!--Pulsante per l'eventuale eliminazione del profilo utente-->
    
        </nav>
                    </form>
                </div> 
            <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
