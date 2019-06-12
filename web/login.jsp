<%-- 
    Document   : login
    Created on : 30-apr-2019, 13.38.49
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Login</title>
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

        <!--Creazione Box per il login dell'utente con relativi elementi-->
        
        <div class="login">
            <img src="img/avatar.png" class="avatar" alt="avatar">
                <h1>Login</h1>
                    <form action="login.html" method="post"><!--collegamento 
                        a articoli del box di login-->
                <label>Email: </label>
                <input type="text" name="email" placeholder="Email"/>
                <br>
                <label>Password: </label>
                <input type="password" name="password" placeholder="Password"/>
                <br>
                <input id="entra" type="submit" name="accedi" value="Accedi"/>
                
                <!--Collegamento alla pagina di registrazione per eventuale
                nuovo utente-->
                <br>                
            </form>
                <form action="registrazione.html" method="post">
                <input id="reg" type="submit" name="registrati" value="Registrati"/>                                            
                </form>
                
                <!--Collegamento alla pagina di valutazione-->
                <input id="val" type="submit" name="valutazione" value="Valuta Articolo"/>
            </div>
                </div> 
        <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html> 
