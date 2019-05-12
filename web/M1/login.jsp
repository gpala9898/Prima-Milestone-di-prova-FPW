<%-- 
    Document   : login
    Created on : 30-apr-2019, 13.38.49
    Author     : Gianluca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="author" content="Gianluca Pala">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="stylesheet" type="text/css" href="./css/login.css"/>
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <img src="../img/avatar.png" class="avatar" alt="avatar">
                <h1>Login</h1>
                    <form action="login.html" method="post"><!--collegamento 
                        a articoli del box di login-->
                <label>Email: </label>
                <input type="text" name="email" placeholder="Email"/>
                <br>
                <label>Password: </label>
                <input type="password" name="password" placeholder="Password"/>
                <br>
                <input type="submit" value="Accedi"/>
                
                <!--Collegamento alla pagina di registrazione per eventuale
                nuovo utente-->
                <br><br>
                <a href="registrazione.jsp">Non hai un account?<br>Registrati</a>
                
                
                <a id="valuta" href="valutazione.jsp">Valuta <br>un articolo</a>
            </form>
            </div>
                </div> 
        <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html> 
