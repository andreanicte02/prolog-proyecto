# Proyecto 1

## Problema 1

Hechos:

Recibe un argumento para indicar cual es el culpable del problema.

```
es_culpable(X)
```

Es mujer recibe un argumento para declarar un género.

```
es_mujer()
```

Es hombre recibe un argumento para declarar un género.

```
es_hombre()
```

Recibe 2 argumentos y se utilizará para definir las parejas de la familia.

```
es_esposa(,)
```

Recibe 2 argumentos y se utilizará para definir las hermanas de algún miembro de la familia.

```
es_hermana(,)
```

Recibe 2 argumentos y se utilizará para definir los hermanos de algún miembro de la familia.

```
es_hermana(,)
```

Recibe 2 argumentos y se utiliza para definir los hijos de algún miembro de la familia.

```
es_padre(,)
```

Recibe 1 argumento y se utiliza para definir la acción de llorar de un miembro de la familia.

```
estaban_llorando()
```

Recibe 2 argumentos y se utiliza para definir la acción de charla entre 2 miembros de la familia.

```
charlaba_con(,)
```

Reglas:

Se reciben 2 argumentos y se indica que la charla de los personajes es en 2 direcciones.

```
charlaban(X,Y):- charlaba_con(X,Y);
                 charlaba_con(Y,X).
```

Se reciben 2 argumentos y se indica que cuando son hermanos, la relación es en ambas direcciones, ya sea si se define como hermana o como hermano.

```
son_hermanos(X,Y):- es_hermana(X,Y); 
                    es_hermana(Y,X);
                    es_hermano(Y,X);
                    es_hermano(X,Y).
```

Se reciben 2 argumentos y se indica que cuando la relación es de esposos, esto es en ambas vías.

```
son_esposos(X,Y):- es_esposa(X,Y);
                   es_esposa(Y,X).
```

Se indica que la relación de cuñados depende de la pareja de los hermanos.

```
son_cunis(X,Y):-((son_esposos(X,Z),son_hermanos(Z,Y));
                (son_esposos(Y,Z),son_hermanos(Z,X)))
```

Se indica que la relación de primos depende de los hijos de padres distintos.

```
son_primos(X,Y):-es_padre(Z,X),es_padre(W,Y),
                 son_hermanos(W,Z)
```

La regla que define al culpable indica que debe de ser hermana (descartando al trío de hermanos), indica la entre los hermanos, que debe de ser hombre y que este no está llorando.

```
es_culpable(X):- es_hermana(Y,X),
                 (es_padre(Z,X);es_padre(Z,Y)), 
                 es_padre(W,Z), es_hombre(W), not(estaban_llorando(X))
```

## Problema 2

 Hechos:

Recibe un argumento de parámetro para definir un género de una persona.

```
es_mujer()
es_hombre()
```

Recibe dos argumentos para definir relación entre padre e hijo de una persona.

```
es_padre(,)
```

Recibe dos argumentos y sirve para definir la relación de hermanos que hay entre las personas.

```
es_hermana(,)
```

Recibe dos argumentos y sirve para definir las parejas que hay en el árbol familiar.

```
es_pareja(,)
```

Reglas:

Se indica que cuando son hermanos, está relación es en ambas direcciones

```
son_hermanos(X,Y):- es_hermana(X,Y); 
                    es_hermana(Y,X).
```

Se indica que cuando son pareja, ambas personas son pareja mutua y no solo en una relación

```
son_pareja(X,Y):- es_pareja(X,Y);
                  es_pareja(Y,X).
```

Expresa la relación que hay entre primos, tomando en cuenta que son los hijos de 2 padres que son hermanos.

```
son_primos(X,Y):-es_padre(Z,X),es_padre(W,Y),
                 son_hermanos(W,Z)
```

La relación entre cuñados expresa que, los cuñados serán aquellos, que son pareja de un hermano(a).

```
son_cunis(X,Y):-((son_pareja(X,Z),son_hermanos(Z,Y));
                (son_pareja(Y,Z),son_hermanos(Z,X))).
```

 La relación entre abuelos se define como los hijos, de los hijos de la persona.

```
son_abuelo(X,Y):-es_padre(X,Z)
               ,(es_padre(Z,Y))
```

La relación de tíos se define que el hijo de los padres van a tener como tíos a los cuñados de los padres, o hermanos de los padres.

```
son_tios(X,Y):-  (son_cunis(X,Z);
                 son_hermanos(X,Z)),
                 es_padre(Z,Y)
```



## Problema 3

#### 

#### Reverso de lista:

Hechos:

Recibe dos listas, se enviara una lista  y se obtendrá la lista volteada, voltear(lista, lista volteada).

```
voltear([],[]).
```

Recibe 1 lista, y dos argumentos, se utilizara para ir juntando la lista volteada y obtener la lista resultante

```
juntar([],Lista,Lista).
```

Reglas:

Se recibe la cabeza o cola y se obtiene la lista volteada, se llama de manera recursiva enviando la cola y la cola al revés, luego se juntan, enviando la lista volteada, la cola al revés y la cabeza de la lista. 

```
voltear([Cabeza|Cola], ListaVolteada):- voltear(Cola, ColaVolteada),
                                        juntar(ColaVolteada,ListaVolteada,[Cabeza]). 
```



Se utiliza para concatenar listas, se envían las 3 listas de manera re cursiva.  

```
juntar([Cabeza1|Lista1],[Cabeza1|Lista3],Lista2):-juntar(Lista1,Lista3,Lista2).
```



#### Lista palindroma:

Hecho :

Recibe dos listas, las dos listas que recibe es la misma que se verifica, retorna true si son palindroma

```
voltear([],[]).
```



Regla:

Se envía una lista por medio de la regla voltear, la misma lista en los dos argumentos, si la lista al revés es igual a la lista sin voltear entonces el resultado es verdadero

```
polindrome(Lista):- voltear(Lista,Lista).
```



#### Repetir de lista:

Hecho:

Se va obtener la lista repetida y se va enviar una lista, repetir(lista repetida,Lista).

```prolog
repetir([],[]).
```



Regla:

Pueden venir listas como argumentos, se llama de manera recursiva la regla, enviando la cola y el resto de la cola de la funcion. 

```
repetir([Cabeza,Cabeza|RestoCola],[Cabeza|Cola]) :- repetir(RestoCola,Cola).
```



#### Dividir:

Hecho:

Recibe una lista, de los otros dos argumentos son las listas que se obtienen al dividir. 

```
dividir([],[],[]).
```

Se recibe el primer elemento de la lista enviada, y en el segundo argumento el primer argumento de la lista enviada.

```
dividir([Elemento1],[Elemento1],[]).
```



Reglas:

Al dividir la lista con la regla, se recibe el elemento 1 y 2 de la lista principal,  luego se van dividiendo las listas, por elementos, se envían las 3 listas de manera recursiva. 

```
dividir([Elemento1,Elemento2|Lista],[Elemento1|Lista1], [Elemento2|Lista2]):-dividir(Lista,Lista1,Lista2).
```



#### Insertar:

Reglas:

Recibe el elemento, seguido de 1 en caso fuera en la primera posición donde habría que insertar el elemento, la lista, y el ultimo argumento seria la lista con el dato insertado

```
insertar(X,1,L,[X|L]):-!.
```



K es el index - 1 , se inserta el elemento en la posición K, se envía la Lista a la que se va insertar el dato.

```
insertar(X,Index,[Cabeza|Lista1],[Cabeza,Lista2]):-K is Index-1, 
                                insertar(X,K,Lista1,Lista2).
```

## Problema 4

el problema 4 se resuelve utilizando listas, una regla recursiva y 2 funciones nativas de prolog.

```
sudoku(Juego, Solucion)
```

