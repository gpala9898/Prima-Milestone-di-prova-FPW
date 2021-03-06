create table utente(
id_utente serial primary key,
nome varchar(100),
cognome varchar(100),
email varchar(100),
password varchar(100),
ente varchar(100),
tipo varchar(100),
immagine varchar(100)
);

create table articolo(
id_articolo serial primary key,
titolo varchar(100),
testo varchar(300),
data varchar(100),
situazione varchar(100),
immagine varchar(300)
);

create table modart(
id_aut bigint unsigned, foreign key autore_fk (id_aut) references utente (id_utente) on update cascade on delete cascade,
id_art bigint unsigned, foreign key articolo_fk (id_art) references articolo (id_articolo) on update cascade on delete cascade,
primary key (id_aute,id_art)
);

create table valutazione(
id_valutazione serial primary key,
id_autore bigint unsigned, foreign key autore_fk (id_autore) references utente (id_utente) on update cascade on delete cascade,
id_articolo bigint unsigned, foreign key articolo_fk (id_articolo) references articolo (id_articolo) on update cascade on delete cascade,
voto tinyint,
commaut varchar(300),
commorg varchar(300)
);

insert into utente(nome, cognome,email,password,ente,tipo,immagine)
values("Gianluca","Pala","gianlucapala98@gmail.com","Milestone19","http://facolta.unica.it/ingegneriainformatica/","autore","http://www.balooa.com/img/icon-registra-utente.jpg?m=1398631416");

insert into utente(nome, cognome,email,password,ente,tipo,immagine)
values("Bill","Gates","billgates55@outlook.com","SonoRicco","https://support.microsoft.com/it-it","organizzatore","https://static.milanofinanza.it/content_upload/img/2018/02/201802190833455455/Gates-Bill-326203.jpg");

insert into utente(nome, cognome,email,password,ente,tipo,immagine)
values("Elon","Musk","elon71@gmail.com","tesla1971","https://www.tesla.com/it_IT/models","autore","https://pixel.nymag.com/imgs/daily/selectall/2018/09/07/07-elon-musk-smoking-weed.w700.h700.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("La protezione dei dati aiuta l'economia digitale","Oggi abbiamo processori in grado di raccogliere, archiviare e processare enormi quantità 
di dati, che hanno consentito lo svilupparsi delle tecnologie...","07/03/2019","Aperto","https://protezionedatipersonali.it/images/gdpr.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("ASUS ROG Zephyrus S GX531, la recensione","ASUS ROG Zephyrus S GX531 è uno dei portatili
 più potenti del mercato. Ed è anche il più sottile con questo hardware...","15/01/2019","Da valutare","https://d2skuhm0vrry40.cloudfront.net/2019/articles/2019-03-04-20-59/DSC02913_920x613.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("I vantaggi dell'Intelligenza Artificiale","Quando si parla di macchine pensanti, non c'è dubbio che la letteratura di genere abbia una predilezione per i soggetti distopici (lo stesso Asimov nei suoi 
racconti metteva continuamente in evidenza le falle delle tre leggi elencate sopra)...","27/12/2018","Accettato","https://www.galileonet.it/wp-content/uploads/2018/10/artificial-intelligence-3382507_1280.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("ADA,il braccio robotico che aiuta a mangiare","Un team di ricercatori della Washington University ha messo a punto un braccio 
robot per aiutare disabili e invalidi a mangiare  in autonomia...","14/03/2017","Rifutato","https://www.hurolife.it/wp-content/uploads/2019/03/braccio-robotico-autonomo.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("AMD al Computex 2019, svelati i processori Ryzen 3000","Prima conferenza della fiera, quella AMD ha ospitato anche una
 sorta di  cerimonia d'inizio del Computex, l'enorme fiera dedicata all'informatica ...","27/05/2019","Aperto","https://multiplayer.net-cdn.it/thumbs/images/2019/05/27/amd-lisa-su-computex.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("Tesla Model 3: prime consegne in USA della versione base","Apparentemente, Tesla ha iniziato a consegnare la versione base di Tesla Model  3
 (“Standard Range”) per 35.000 dollari in USA. Questa è ...","15/05/2019","Accettato","https://www.investireoggi.it/motori/wp-content/uploads/sites/17/2019/05/Tesla-Model-3-640x342.jpg");

insert into articolo(titolo,testo,data,situazione,immagine)
values("Tesla rinvia lancio del camion al 2020","Le difficoltà di produzione della Tesla si riflettono anche sul camion elettrico, che l'azienda statunitense doveva lanciare quest'anno ma che invece non nascerà prima del 2020.
 Lo affermano fonti statunitensi citando le dichiarazioni del presidente del programma Semi, Jerome Guillen...","13/05/2019","Da valutare","http://www.trasportoeuropa.it/images/Categorie/Camion/Tecnica/CamionElettrici/Tesla_Semi_bisarca_fntMusk.jpg");

insert into valutazione(id_autore,id_articolo,voto,commaut,commorg)
values(1,5,5,"Articolo ben dettagliato","Ben strutturato");

insert into valutazione(id_autore,id_articolo,voto,commaut)
values(1,6,5,"Ottimo articolo");

insert into valutazione(id_autore,id_articolo,voto,commaut,commorg)
values(3,1,5,"Articolo ben dettagliato","Articolo ricco di informazioni");

insert into valutazione(id_autore,id_articolo,voto,commaut)
values(3,2,4,"Ottimo articolo");

insert into valutazione(id_autore,id_articolo,voto,commaut,commorg)
values(3,3,2,"Articolo noioso","Articolo da bocciare");

insert into valutazione(id_autore,id_articolo,voto,commaut)
values(3,4,4,"Bell'articolo");

insert into modart(id_aut,id_art)
values(1,1);

insert into modart(id_aut,id_art)
values(1,2);

insert into modart(id_aut,id_art)
values(3,2);

insert into modart(id_aut,id_art)
values(3,3);

insert into modart(id_aut,id_art)
values(1,3);

insert into modart(id_aut,id_art)
values(1,4);

insert into modart(id_aut,id_art)
values(1,5);

insert into modart(id_aut,id_art)
values(3,5);

insert into modart(id_aut,id_art)
values(3,6);

insert into modart(id_aut,id_art)
values(3,7);
