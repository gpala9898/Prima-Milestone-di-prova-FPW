/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function createElement(autore){

    var found = $("<a>").html(autore.nome + ", " + autore.cognome + " (" + autore.id + ")");

    return $("<li>").append(found);    
}

function stateSuccess(data){ //Ho ricevuto una risposta HTTP con stato positivo
    //Quindi data è la risposta (array di json) che ho costruito nel JSP

    var autoriDiv = $("#inautori ul");

    $(autoriDiv).empty();

    for(var instance in data){
        $(autoriDiv).append(createElement(data[instance]));
    }
    
    $("#inautori ul li a").click(function () {
        var text = $(this).text();
        $("#author").val(text);
        $(autoriDiv).empty();
    });
}

function stateFailure(data, state){
    console.log(state);
}

$(document).ready(function() { 

    $("#author").keyup(function(event){
       $.ajax({
          url: "suggest.json", 
          data: {cmd: "author",
                 toSearch: event.target.value
          },
          dataType: 'json',
          success: function(data)
          {stateSuccess(data);},
          error: function(data, state)
          {stateFailure(data, state);}
       });
        
    });
    
    /*var aut = $("#author").val();
    if (aut === "") {
        $("#inautori").hide();
        $("#author").keydown(function () {
            $("#inautori").empty();
        }
        );
    }*/
});
