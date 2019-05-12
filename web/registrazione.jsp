<%-- 
    Document   : registrazione
    Created on : 30-apr-2019, 13.13.57
    Author     : Gianluca
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- con if non posso utilizzare l'else, quindi devo usare when per visualizzare 
profilo se l'utente è loggato o registrazione se non lo è, uso otherwise per la
funzione else -->
<c:choose>
    <c:when test="${utente.getId}!= null">
        <title>Profilo</title>
    </c:when> 
    <c:otherwise>
        <title>Registrazione</title>
    </c:otherwise>
</c:choose>
<meta charset="UTF-8">
<meta name="author" content="Gianluca Pala">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
<link rel="stylesheet" type="text/css" media="all" href="style.css">


<meta name="viewport" content="width=device-width, initial-scale=1.0">


<body>

    <!--Qui includo il mio header-->
    <jsp:include page="header.jsp"/>

    <div id="Sfondo_nero"></div>
    <div class="main_content">

        <aside></aside>

        <!--Creazione del box per la registrazione con gli stessi elementi
        che ci sono nella pagina di riepilogo del profilo-->

        <div class="registrati">

            <img src="img/avatar.png" class="avatar" alt="avatar"><!--Immagine per migliorare aspetto del box--> 

            <form action="registrazione.html" method="post">
                <c:choose>
                    <c:when test="${utente.getId() != null}">
                        <h1>Profilo</h1>
                        </c:when>
                        <c:otherwise>
                            <h1>Registrazione</h1>
                        </c:otherwise>
                    </c:choose>

                <label>Nome: </label><br>
                <input type="text" placeholder="Nome Utente" value="${utente.getNome()}"/>
                <br><br>
                <label>Cognome: </label><br>
                <input type="text" placeholder="Cognome Utente" value="${utente.getCognome()}"/>
                <br><br>
                <label>Ente: </label><br>
                <input type="text" placeholder="Ente" value="${utente.getEnte()}"/>
                <br><br>                
                <!--Pulsante per l'inserimento di un'immagine-->                                                          
                <label>Immagine:</label><br> 
                <input type="url" name="file" value="${utente.getImmagine()}"/>
                <br><br>
                <label>Email: </label><br>
                <input type="text" placeholder="Email" value="${utente.getEmail()}"/>
                <br><br>
                <label>Password: </label><br>
                <input type="password" placeholder="Password" value="${utente.getPassword()}"/>
                <br><br>
                <label>Tipologia Utente (autore o organizzatore):</label><br/>
                <input type="text" placeholder="Tipo" value="${utente.getTipo()}"/>
                
                <!--Se l'utente non è loggato il tasto che comparirà sarà quello
                di registrazione, altrimenti sarà il tasto salva per modificare
                eventuali campi-->
                <c:choose>
                    <c:when test="${utente.getId() != null}">
                        <input type="submit" value="Salva"/>  
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="Registrati"/> 
                    </c:otherwise>
                </c:choose>          
            </form>
        </div>

    </div>
    <!--Qui includo il mio footer-->
    <jsp:include page="footer.jsp"/>
</body>

