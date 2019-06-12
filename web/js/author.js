/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function createElement(autore){

    var found = $("<a>").html(autore.nome,autore.cognome (autore.id));

    return $("<input>").append(found);    
}

function stateSuccess(data){ //Ho ricevuto una risposta HTTP con stato positivo
    //Quindi data è la risposta (array di json) che ho costruito nel JSP

    var autoriDiv = $("#inautori");

    $(autoriDiv).empty();

    for(var instance in data){
        $(autoriDiv).append(createElement(data[instance]));
    }
}

function stateFailure(data, state){
    console.log(state);
}

$(document).ready(function() { //Quando è pronto il DOM
    
    $("#author").keyup(function(event){ //Quando viene scritto qualcosa nella textbox
      
       $.ajax({
          url: "SuggestAuthors", 
          data: {cmd: "author",
                 toSearch: event.target.value
          },
          dataType: 'json',
          success: function(data, state){stateSuccess(data);},
          error: function(data, state){stateFailure(data, state);}
       });
        
    });
    
});
