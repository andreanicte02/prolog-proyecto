% Hechos

hombre(pedro).
hombre(luis).
mujer(maria).
mujer(luisa).

es_padre(pedro,luis).
es_padre(luis,maria).
es_madre(maria,luisa).

% Reglas

es_abuelo(Var1,Var2):-es_padre(Var1,Var3),(es_padre(Var3,Var2)).
