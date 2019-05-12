<%-- 
    Document   : error
    Created on : 6-mag-2019, 10.04.05
    Author     : Gianluca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        
        <title>ERRORE</title>
        <meta charset="UTF-8">
        <meta name="author" content="Gianluca Pala">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>

         <!--Creazione cover della pagina di sfondo per l'inserimento degli 
            elementi della pagina-->
         
            <div id="Sfondo_nero"></div>            
                <div class="main_content">
                    
                    <h1>ERRORE</h1>
                    <a type="submit" id="button" href="logout.html?logout=true">LOGOUT</a>
                </div>
        <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>


