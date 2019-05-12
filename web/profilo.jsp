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
                        
    <!--Messaggio di benvenuto-->
    <p>Benvenuto, ${utente.getNome()} ${utente.getCognome()}!</p>

    <a type="submit" id="button" href="logout.html?logout=true">LOGOUT</a>              
    <br>
    <br>
    
</aside>
                    <!--Creazione tabella con i dati del profilo utente con
                    i campi che ritrovo in fase di registrazione-->
                    
                    <form action="" method="post">
                        <table class="tabellaprofilo">
                        <tr>
                            <th><img id="image" src="img/images.png" alt="utente"></th>
                            <th><b>PROFILO</b></th>                             
                        </tr>
                        <tr class="rigadispari">
                            <td colspan="2"><label>Nome<br></label>
                        <input type="text" name="nome" value="${utente.getNome()}"/></td>
                           
                        </tr>
                        <tr class="rigapari">
                            <td colspan="2"><label>Cognome<br></label>
                        <input type="text" name="cognome" value="${utente.getCognome()}"/></td>
                                                  
                        </tr>
                        <tr class="rigadispari">
                            <td colspan="2"><label>Email<br></label>
                        <input type="text" name="Email" value="${utente.getEmail()}"/></td>
                                                     
                        </tr>
                        
                        <tr class="rigapari">
                            <td colspan="2"><label>Password<br></label>
                        <input type="password" name="password" value="${utente.getPassword()}"/></td>
                                                     
                        </tr>
                        
                        <tr class="rigadispari">
                            <td colspan="2"><label>Ente<br></label>
                        <input type="url" name="Ente" value="${utente.getEnte()}"/></td>                        
                        </tr>
                        
                        <tr class="rigapari">
                            
                            <!--Form per l'inserimento dell'immagine-->
                            <td colspan="2">                               
                                Foto<br> <input type="url" name="immagine" value="${utente.getImmagine()}"/>
                                </td>                        
                        </tr>
                        
                        <tr class="rigadispari">
                            <td colspan="2"><label>Tipo Utente<br></label>
                        <input type="text" value="${utente.getTipo()}"/></td>                        
                        </tr>
                        
                    </table>
                    <br>  
                    
                    <!--Pulsante per il salvataggio dei dati del profilo in caso
                    di eventuale modifica (NON FUNZIONANTE)-->
                    
                    <nav class="azione">
                        <button type="submit">SALVA</button><br><br>
                        <a>Cancellati</a>
                    <!--Pulsante per l'eventuale eliminazione del profilo utente
                    (NON FUNZIONANTE)-->
    
        </nav>
                    </form>
                </div> 
            <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
