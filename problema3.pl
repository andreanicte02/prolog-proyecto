
%swipl -s problema3.pl


repetir_lista([],[]).
repetir_lista([Cabeza|Cola],[Cabeza,Cabeza|RestoCola]) :- repetir_lista(Cola,RestoCola).


voltear_lista([],[]).
voltear_lista([Cabeza|Cola], ListaVolteada):- voltear_lista(Cola, ColaListaVolteada),
                                              juntar_listas(ColaListaVolteada,[Cabeza],ListaVolteada).                                
juntar_listas([],Lista,Lista).
juntar_listas([Cabeza1|Cola1],Cola2,[Cabeza1|Cola4]):-juntar_listas(Cola1,Cola2,Cola4).


polindrome(Lista):- voltear_lista(Lista,Lista).

%dividir(List,List2,List3)
dividir([],[],[]).
dividir([Elemento1],[Elemento1],[]).
dividir([Elemento1,Elemento2|Lista],(Elemento1|Lista1), [Elemento2|Lista2]):-dividir(Lista,Lista1,Lista2).