<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Sign up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Gianluca Pala">
        <meta name="keywords" content="FPW, Progetto, HTML, CSS, Java">
        <meta name="description" content="Pagina di registrazione delle esercitazioni di FPW">
        <link rel="stylesheet" type="text/css" href="style.css" media="screen">
    </head>
    <body>

        <!-- Include header here -->
        <jsp:include page="header.jsp"/>

        <div id="main_content">
            <aside>
                <div>
                    <ol>
                        <c:forEach items="${libri}" var="libro">
                            <li>
                                <a href="modificaLibro.html?lid=${libro.getId()}">
                                    ${libro.getTitolo()}
                                </a>
                            </li>
                        </c:forEach>
                    </ol> 
                </div> 
                <div>
                    <a href="logout.html?logout=true">Logout</a>
                </div>
            </aside>

            <main>
                <p>
                    Benvenuto, ${autore.getNome()} ${autore.getCognome()}!
                </p>
            </main>

        </div>
        <!--Qui includo il mio footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
