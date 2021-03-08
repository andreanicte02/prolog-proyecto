sudoku(Juego, Solucion) :-
    Solucion = Juego,
    Juego = [V11, V12, V13, V14,
              V21, V22, V23, V24,
              V31, V32, V33, V34,
              V41, V42, V43, V44],

    Fila1 = [V11, V12, V13, V14],
    Fila2 = [V21, V22, V23, V24],
    Fila3 = [V31, V32, V33, V34],
    Fila4 = [V41, V42, V43, V44],

    Columna1 = [V11, V21, V31, V41],
    Columna2 = [V12, V22, V32, V42],
    Columna3 = [V13, V23, V33, V43],
    Columna4 = [V14, V24, V34, V44],

    Reco1 = [V11, V12, V21, V22],
    Reco2 = [V13, V14, V23, V24],
    Reco3 = [V31, V32, V41, V42],
    Reco4 = [V33, V34, V43, V44],

    Lista = [Fila1, Fila2, Fila3, Fila4,
           Columna1, Columna2, Columna3, Columna4,
           Reco1, Reco2, Reco3, Reco4],

    maplist(permutation([1,2,3,4]), Lista).