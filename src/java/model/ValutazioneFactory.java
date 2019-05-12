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

/*Creo una Factory per valutazione dove inserirò dei dati fittizi*/
public class ValutazioneFactory {
    private static ValutazioneFactory singleton;
    
    private ValutazioneFactory(){}
    
    public static ValutazioneFactory getInstance(){
        if(singleton == null){
            singleton = new ValutazioneFactory();
        }
        return singleton;
    }

    /*Creo una lista di oggetti con valori inventati da poter essere richiamati
    nelle pagine dove servono*/
    public List<Valutazione> getValutazione(){
        List<Valutazione> valutazioni = new ArrayList<>();
            
        Valutazione val1 = new Valutazione();
        val1.setId(1);
        val1.setVoto(5);
        val1.setCommaut("Articolo ben strutturato");
        Article art1 = ArticleFactory.getInstance().getArticleId(1);
        int v1=art1.getId();        
        valutazioni.add(val1);
        
        
        Valutazione val2 = new Valutazione();
        val2.setId(2);
        val2.setVoto(2);
        val2.setCommaut("Articolo poco interessante");
        Article art2 = ArticleFactory.getInstance().getArticleId(2);
        int v2=art2.getId();
        valutazioni.add(val2);
        
        return valutazioni;
    }
   
}
