
%swipl -s problema3.pl

%repetir(ListaRepetida,Lista)
repetir([],[]).
repetir([Cabeza,Cabeza|RestoCola],[Cabeza|Cola]) :- repetir(RestoCola,Cola).

%voltear(Lista,ListaVolteada)
voltear([],[]).
voltear([Cabeza|Cola], ListaVolteada):- voltear(Cola, ColaVolteada),
                                              juntar(ColaVolteada,ListaVolteada,[Cabeza]).                                
juntar([],Lista,Lista).
juntar([Cabeza1|Lista1],[Cabeza1|Lista3],Lista2):-juntar(Lista1,Lista3,Lista2).

%se mandan la misma lista como la que se recibe y la que se obtiene al voltearla
%si son iguales es verdadero
polindrome(Lista):- voltear(Lista,Lista).

%dividir(List,List2,List3)
dividir([],[],[]).
dividir([Elemento1],[Elemento1],[]).
dividir([Elemento1,Elemento2|Lista],(Elemento1|Lista1), [Elemento2|Lista2]):-dividir(Lista,Lista1,Lista2).

%insertar
insertar(X,1,L,[X|L]):-!.
insertar(X,Index,[Cabeza|Lista1],[Cabeza,Lista2]):-K is Index-1, 
                                insertar(X,K,Lista1,Lista2).