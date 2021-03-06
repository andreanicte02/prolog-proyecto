# Proyecto 1



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

