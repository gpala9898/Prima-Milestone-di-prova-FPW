/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gianluca
 */

/*Creo una classe articolo Factory con la funzione di contenere i dati 
fittizi di determinati articoli collegati all'utente che sta usando la pagina*/

public class ArticleFactory {
    private static ArticleFactory singleton;
    
    private ArticleFactory(){
        
    }
    
    public static ArticleFactory getInstance(){
        if(singleton == null){
            singleton = new ArticleFactory();
        }
        
        return singleton;
    }
    
    public List<Article> getArticle(){
        List<Article> articoli = new ArrayList<>();
        
        Article dc = new Article();
        dc.setId(1);
        dc.setTitolo("I robot a scuola");
        dc.setTesto("La robotica a scuola, insieme al coding, sta rivoluzionando"
                + " i metodi d’insegnamento e d’apprendimento, rendendo entrambi"
                + " più piacevoli, per insegnanti, bambini e ragazzi. Più piacevoli"
                + " perché i robot sono percepiti da tutti, adulti e bambini, come"
                + " momento ludico, di divertimento, di gioco, più che come un vero"
                + " momento d’apprendimento. Ed è dimostrato che migliorano anche"
                + " le interazioni fra studenti e fra questi e gli insegnanti.");
        dc.setData("06/04/2019");
        dc.setCreatore("Gianluca Pala");
        dc.setSituazione("Aperto");
        dc.setnValutatori(3);
        dc.setImmagine("https://myfacemood.com/wp-content/uploads/2017/01/Myfacemood-Google-manda-i-robot-a-scuola.png");
        Utente gianluca = UtenteFactory.getInstance().getUtenteById(1);
        dc.getUtente().add(gianluca);
        articoli.add(dc);
        
        Article vn = new Article();
        vn.setId(2);
        vn.setTitolo("La protezione dei dati aiuta l'economia digitale");
        vn.setTesto("Oggi abbiamo processori in grado di raccogliere, archiviare e processare enormi quantità\n"
                + "di dati, che hanno consentito lo svilupparsi delle tecnologie big data e reti che permettono\n" 
                + "la trasmissione di enormi quantità di dati, e a costi bassissimi, da un server "
                + "all’altro, tutti interconnessi, così come consente la tecnologia"
                + " cloud. Abbiamo la possibilità di raccogliere dati sempre più"
                + " numerosi e dettagliati sui comportamenti degli esseri umani,"
                + " attraverso le informazioni che essi stessi diffondono usando"
                + " i social e i motori di ricerca.");
        vn.setData("07/03/2019");
        vn.setCreatore("Gianluca Pala");
        vn.setSituazione("Da valutare");
        vn.setImmagine("https://protezionedatipersonali.it/images/gdpr.jpg");
        vn.getUtente().add(gianluca);
        articoli.add(vn);
        
        Article ps = new Article();
        ps.setId(3);
        ps.setTitolo("ASUS ROG Zephyrus S GX531, la recensione");
        ps.setTesto("ASUS ROG Zephyrus S GX531 è uno dei portatili più potenti del mercato."
                + " Ed è anche il più sottile – circa 16mm al più – con questo hardware. "
                + "Un portatile al di "
                + "là della curva per molti versi, che ci fa intravedere quale "
                + "sarà il prossimo futuro dei gaming laptop, ed in un certo "
                + "senso anche i loro limiti.");
        ps.setData("15/01/2019");
        ps.setCreatore("Gianluca Pala");
        ps.setSituazione("Da valutare");
        ps.setImmagine("https://d2skuhm0vrry40.cloudfront.net/2019/articles/2019-03-04-20-59/DSC02913_920x613.jpg/EG11/resize/690x-1/quality/75/format/jpg");
        ps.getUtente().add(gianluca);
        articoli.add(ps);
        
        Article rs = new Article();
        rs.setId(4);
        rs.setTitolo("I vantaggi dell'Intelligenza Artificiale");
        rs.setTesto("Quando si parla di macchine pensanti,"
                + " non c'è dubbio che la"
                + "letteratura di genere abbia una predilezione"
                + "per i soggetti distopici (lo stesso Asimov nei suoi "
                + "racconti metteva continuamente in evidenza le"
                + "falle delle tre leggi elencate sopra). "
                + "Senza contare che fior di scienziati"
                + "stanno mettendo in guardia"
                + "gli sviluppatori sui potenziali pericoli derivanti"
                + "dalle AGI una volta fuori dal nostro controllo diretto. "
                + "Reazioni di questo tipo sono comprensibili: "
                + "la paura dell'ignoto è parte della"
                + "nostra natura, ma è il caso di soffermarsi in"
                + "eguale misura sui numerosi e notevoli"
                + "vantaggi portati dalle AI nelle nostre vite"
                + "e nell'evoluzione della società,"
                + "molti dei quali sono evidenti già nel presente.");
        rs.setData("27/12/2018");
        rs.setCreatore("Gianluca Pala");
        rs.setSituazione("Accettato");
        rs.setnValutatori(3);
        rs.setImmagine("https://www.galileonet.it/wp-content/uploads/2018/10/artificial-intelligence-3382507_1280.jpg");
        rs.getUtente().add(gianluca);
        articoli.add(rs);
        
        Article ms = new Article();
        ms.setId(5);
        ms.setTitolo("ADA, il braccio robot che aiuta a mangiare");
        ms.setTesto("Un team di ricercatori della Washington University ha messo" 
                + "a punto un braccio robot per aiutare disabili e invalidi a "
                + "mangiare in autonomia si chiama ADA, acronimo di Assistive "
                + "Dexterous Arm, e si può utilizzare collegato direttamente al "
                + "letto o alla carrozzina.Il software di controllo è un "
                + "sistema di intelligenza artificiale istruito "
                + "anche per riconoscere il tipo di cibo nel piatto, per raccoglierlo"
                + "e porgerlo nel modo più idoneo: ADA sa usare le posate come un "
                + "assistente umano. Il segreto è RetinaNet, un sistema di visione "
                + "che riconosce e distingue i diversi alimenti: identificato che "
                + "cosa c'è nel piatto, il comando passa a SPNet, che in base all'alimento"
                + "sceglie il modo migliore per porgerlo al paziente.");
        ms.setData("14/03/2017");
        ms.setCreatore("Gianluca Pala");
        ms.setSituazione("Rifiutato");
        ms.setnValutatori(3);
        ms.setImmagine("https://www.hurolife.it/wp-content/uploads/2019/03/braccio-robotico-autonomo.jpg");
        ms.getUtente().add(gianluca);
        articoli.add(ms);
        
        return articoli;
    }
    
    /*prende gli articoli in base al loro autore a partire da tutti gli articoli
    presenti*/
    public List<Article> getArticleAutore(Utente u){
        List<Article> articleAuthor = new ArrayList<>();
        List<Article> allArticles = this.getArticle();
        
        for(Article a : allArticles){
            for(Utente u1 : a.getUtente()){
                if(u1.equals(u)){
                    articleAuthor.add(a);
                }
            }
        }
        
        return articleAuthor;
    }
    
    /*Mostra gli articoli in base al loro ID*/
    public Article getArticleId(int artid){
        List<Article> allArticles = this.getArticle();
        for(Article a : allArticles){
            if(a.getId() == artid){
                return a;
            }
        }
        return null;
    }
    
}
