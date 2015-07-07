jugador(stuart, [piedra, piedra, piedra, piedra, piedra, piedra, piedra, piedra], 3).
jugador(tim, [madera, madera, madera, madera, madera, pan, carbon, carbon, carbon, pollo, pollo], 8).
jugador(steve, [madera, carbon, carbon, diamante, panceta, panceta, panceta], 2).

lugar(playa, [stuart, tim], 2).
lugar(mina, [steve], 8).
lugar(bosque, [], 6).

comestible(pan).
comestible(panceta).
comestible(pollo).
comestible(pescado).
/*Te sugiero este cambio/
/*Te sugiero este cambio/
comestible(caramelos).

tieneItem(Jugador,Item):-
  jugador(Jugador,Items,_),
  member(Item,Items).
  
sePreocupaPorSuSalud(Jugador):-
  jugador(Jugador,Items,_),
  comestible(Item),
  member(Item,Items).
  
cantidadDeItem(Jugador,Item,Cantidad):-
  jugador(Jugador,Items,_),
  tieneItem(Jugador,Item),
  findall(_,member(Item,Items),L),
  length(L,Cantidad).
  
tieneMasDe(Jugador,Item):-
  cantidadDeItem(Jugador,Item,Cantidad),
  forall((cantidadDeItem(JugadorOtro,Item,CantidadOtra),JugadorOtro \= Jugador),Cantidad > CantidadOtra).
  
hayMonstruos(Lugar):-
  lugar(Lugar,_,NivelDeOscuridad),
  NivelDeOscuridad > 6.
  
correPeligro(Jugador):-
  estaEn(Jugador,Lugar),
  hayMonstruos(Lugar).  
  
correPeligro(Jugador):-
  estaHambriento(Jugador),
  not(tieneComestibles(Jugador)).
  
estaEn(Jugador,Lugar):-
  lugar(Lugar,Jugadores,_),
  member(Jugador,Jugadores).
  
estaHambriento(Jugador):-
  jugador(Jugador,_,NivelDeHambre),
  NivelDeHambre < 4.
  
tieneComestibles(Jugador):-
  jugador(Jugador,Items,_),
  comestible(ItemComestible),
  member(ItemComestible,Items).
  
estaPoblado(Lugar):-
  lugar(Lugar,Jugadores,_),
  length(Jugadores,Poblacion),
  Poblacion > 0.
  
nivelPeligrosidad(Lugar,NivelDePeligrosidad):-
  lugar(Lugar,Jugadores,_),
  estaPoblado(Lugar),
  not(hayMonstruos(Lugar)),
  length(Jugadores,PoblacionTotal),
  findall(_,(member(Jugador,Jugadores),estaHambriento(Jugador)),L),
  length(L,Longitud),
  PorcentajeHambrientos is (Longitud * 100) / PoblacionTotal,
  NivelDePeligrosidad is PorcentajeHambrientos / PoblacionTotal.
  
nivelPeligrosidad(Lugar,NivelDePeligrosidad):-  
  estaPoblado(Lugar),
  hayMonstruos(Lugar),
  NivelDePeligrosidad = 100.
  
nivelPeligrosidad(Lugar,NivelDePeligrosidad):-
  lugar(Lugar,_,NivelDeOscuridad),
  not(estaPoblado(Lugar)),
  NivelDePeligrosidad is NivelDeOscuridad * 10.
  
item(horno, [ itemSimple(piedra, 8) ]).
item(placaDeMadera, [ itemSimple(madera, 1) ]).
item(palo, [ itemCompuesto(placaDeMadera) ]).
item(antorcha, [ itemCompuesto(palo), itemSimple(carbon, 1) ]).

puedeConstruirItem(Jugador,itemSimple(Item,CantidadMinima)):-
  cantidadDeItem(Jugador,Item,Cantidad),
  Cantidad >= CantidadMinima.
  
puedeConstruirItem(Jugador,itemCompuesto(ItemCompuesto)):-  
  puedeConstruir(Jugador,ItemCompuesto).
  
puedeConstruir(Jugador,Item):-
  jugador(Jugador,_,_),
  item(Item,ItemsNecesarios),
  forall(nth0(_,ItemsNecesarios,ItemActual),puedeConstruirItem(Jugador,ItemActual)).
  
/*

1) Muestra false, porque lugar(desierto,...) no forma parte de la base de conocimientos.
2) Poder conocer la existencia o el valor de los argumentos que hacen verdadera una consulta.

*/
  







