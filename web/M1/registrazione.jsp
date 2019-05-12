<%-- 
    Document   : registrazione
    Created on : 30-apr-2019, 13.13.57
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Registrazione</title>
        <meta charset="UTF-8">
        <meta name="author" content="Gianluca Pala">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        
         <!--Qui includo il mio header-->
        <jsp:include page="header.jsp"/>
        
        <div id="Sfondo_nero"></div>
        <div class="main_content">
                    
                <aside></aside>
                
                <!--Creazione del box per la registrazione con gli stessi elementi
                che ci sono nella pagina di riepilogo del profilo-->
                
                   <div class="registrati">
        
                       <img src="../img/avatar.png" class="avatar" alt="avatar"><!--Immagine per migliorare aspetto del box--> 
                <h1>REGISTRATI</h1>
                
                 <form action="registrazione" method="post">
                     <c:if test="${param[\"userName\"] != null}">

                        <p>Benvenuto, ${param["userName"]}</p>

                    </c:if>
                        
                <label>Nome: </label><br>
                <input type="text" placeholder="Nome Utente">
                <br><br>
                <label>Cognome: </label><br>
                <input type="text" placeholder="Cognome Utente">
                <br><br>
                <label>Ente: </label><br>
                <input type="text" placeholder="Ente">
                <br><br>                
                <!--Pulsante per l'inserimento di un'immagine-->                                                          
                    Immagine:<br><br> <input type="url" name="file">
                <br><br>
                <label>Email: </label><br>
                <input type="text" placeholder="Email">
                <br><br>
                <label>Password: </label><br>
                <input type="password" placeholder="Password">
                <br><br>
                 
                <input type="submit" value="Registrati"/>          
            </form>
            </div>
                    
                    </div>
<!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
