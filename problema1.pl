%swipl -s problema1.pl
%hechos
%es_culpable(X):- es_hermana(Y,X),(es_padre(Z,X);es_padre(Z,Y)), es_padre(W,Z), es_hombre(W).

es_mujer(marta).
es_mujer(peper).
es_mujer(rachel).
es_mujer(diana).
es_mujer(may).

es_mujer(lara).
es_mujer(lois).
es_mujer(mery).

es_hombre(bruce).
es_hombre(barry).
es_hombre(enrique).
es_hombre(peter).
es_hombre(ben).

es_hombre(tony).
es_hombre(clark).
es_hombre(harry).
es_hombre(enso).
es_hombre(lorenzo).
es_hombre(sergio).

es_esposa(marta,bruce).
es_esposa(peper,barry).
es_esposa(diana,peter).
es_esposa(may,ben).
es_esposa(rachel,enrique).

es_hermana(lara,tony).
es_hermana(lois,clark).
es_hermana(mery,harry).

es_hermana(rachel,barry).
es_hermana(rachel,diana).
es_hermana(rachel,ben).
es_hermana(diana,barry).
es_hermana(diana,ben).

es_hermano(enso,lorenzo).
es_hermano(enso,sergio).
es_hermano(lorenzo,sergio).


es_hermano(ben,barry).


es_padre(bruce, barry).
es_padre(bruce, rachel).
es_padre(bruce, diana).
es_padre(bruce, ben).

es_padre(marta, barry).
es_padre(marta, rachel).
es_padre(marta, diana).
es_padre(marta, ben).

es_padre(peper, tony).
es_padre(peper, lara).

es_padre(barry, tony).
es_padre(barry, lara).


es_padre(rachel, lois).
es_padre(rachel, clark).

es_padre(diana, mery).
es_padre(diana, harry).

es_padre(peter, mery).
es_padre(peter, harry).

es_padre(may, enso).
es_padre(may, lorenzo).
es_padre(may, sergio).
es_padre(ben, enso).
es_padre(ben, lorenzo).
es_padre(ben, sergio).

estaban_llorando(clark).
estaban_llorando(tony).

charlaba_con(barry,enrique).
charlaba_con(lara,lois).


charlaban(X,Y):- charlaba_con(X,Y);
                 charlaba_con(Y,X).

son_hermanos(X,Y):- es_hermana(X,Y); 
                    es_hermana(Y,X);
                    es_hermano(Y,X);
                    es_hermano(X,Y).

son_esposos(X,Y):- es_esposa(X,Y);
                   es_esposa(Y,X). 

son_cunis(X,Y):-((son_esposos(X,Z),son_hermanos(Z,Y));
                (son_esposos(Y,Z),son_hermanos(Z,X))).

son_primos(X,Y):-es_padre(Z,X),es_padre(W,Y),
                 son_hermanos(W,Z).



es_culpable(X):- es_hermana(Y,X),
                 (es_padre(Z,X);es_padre(Z,Y)), 
                 es_padre(W,Z), es_hombre(W), not(estaban_llorando(X)).












