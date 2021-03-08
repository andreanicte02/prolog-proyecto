%swipl -s problema2.pl
es_mujer(ana).
es_mujer(ruth).
es_mujer(diana).
es_mujer(ines).
es_mujer(soledad).
es_mujer(constancia).
es_hombre(lamar).
es_hombre(pedro).
es_hombre(feliciano).
es_hombre(jonas).
es_hombre(manuel).
es_hombre(daniel).

es_padre(ana,pedro).
es_padre(ana,diana).
es_padre(lamar,diana).
es_padre(lamar,pedro).

es_padre(ruth,ines).
es_padre(ruth,jonas).
es_padre(pedro,ines).
es_padre(pedro,jonas).

es_padre(diana,manuel).
es_padre(feliciano,manuel).

es_padre(jonas,daniel).
es_padre(jonas,constancia).
es_padre(soledad,daniel).
es_padre(soledad,constancia).




es_hermana(diana,pedro).
es_hermana(ines,jonas).
es_hermana(constancia,daniel).

es_pareja(ana,lamar).
es_pareja(ruth,pedro).

es_pareja(diana,feliciano).
es_pareja(jonas,soledad).

son_hermanos(X,Y):- es_hermana(X,Y); 
                    es_hermana(Y,X).

son_pareja(X,Y):- es_pareja(X,Y);
                  es_pareja(Y,X). 

son_primos(X,Y):-es_padre(Z,X),es_padre(W,Y),
                 son_hermanos(W,Z).


son_cunis(X,Y):-((son_pareja(X,Z),son_hermanos(Z,Y));
                (son_pareja(Y,Z),son_hermanos(Z,X))).

son_abuelo(X,Y):-es_padre(X,Z)
               ,(es_padre(Z,Y)).


son_tios(X,Y):-  (son_cunis(X,Z);
                 son_hermanos(X,Z)),
                 es_padre(Z,Y).

print_hermanos(X,Y):- write('Es hermano/a de:'), 
                      son_hermanos(X,Y).

print_esposos(X,Y):- write('Es esposo/a de:'), 
                     son_pareja(X,Y).

print_primos(X,Y):- write('Es primo/a de:'), 
                    son_primos(X,Y).

print_cuñis(X,Y):- write('Es cuñado/a de:'), 
                    son_cunis(X,Y).

print_abue(X,Y):- write('Es abuelo/a de:'), 
                    son_abuelo(X,Y).

print_tio(X,Y):- write('Es tio/a de:'), 
                    son_tios(X,Y).

print_padre(X,Y):-write('es padre/madre de: '),
                  es_padre(X,Y).


%%%%% ejemplo
%%%%% print_abue(ana,Y).

pirnt(_):- write('                                Ana lucia-lamar          '),
                nl,
                write('                              / \\'),
                nl,
                write('               Ruth-Pedro                Diana-Feliciano       '),
                nl,
                write('                  /\\                             |      '),
                nl,
                write('     Ines               Jonas-Soledad          Manuel    '),
                nl,
                write('                            /\\ '),
                nl, 
                write('                   Daniel       Constancia ').



                
                

                

