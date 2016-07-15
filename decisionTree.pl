albero(tempo,
       [
       sottoalbero(incerto, albero(attrazioni,
                            [sottoalbero(molte,andare),
                             sottoalbero(poche, albero(distanza,
                                               [sottoalbero(vicino,andare),
                                               sottoalbero(lontano,non_andare)]))])),

       sottoalbero(piovoso, albero(distanza,
                             [sottoalbero(vicino,andare),
                             sottoalbero(lontano,non_andare)])),
       sottoalbero(sereno,andare)
       ]
      ).

iterateExamples([]).
iterateExamples([H1|T1]) :- assert(H1), iterateExamples(T1).

getRightOperator(Albero, L) :- arg(2, Albero, L).
getLeftOperator(Albero, R) :- arg(1, Albero, R).

findSubTree([FirstSub|List], Key, FirstSub) :-
  arg(1, FirstSub, Key).

findSubTree([H|T], Key, Result) :- findSubTree(T, Key, Result).

iterateTree(Albero, LowerLevel, Classe) :-
  getRightOperator(Albero, Level1),
  getLeftOperator(Albero, RootKey), /* Prendo chiave root, in questo caso meteo */
  caratteristica(RootKey, Valore),
  findSubTree(Level1, Valore, LowerLevel),
  getRightOperator(LowerLevel, Classe),
  atomic(Classe).

classe(Albero, Esempio, Classe) :-
  getLeftOperator(Esempio, Data), /* Prendo caratteristiche */
  iterateExamples(Data),

  getRightOperator(Albero, Level1),
  getLeftOperator(Albero, RootKey), /* Prendo chiave root, in questo caso meteo */
  caratteristica(RootKey, Valore),
  findSubTree(Level1, Valore, LowerLevel),

  getRightOperator(LowerLevel, SecondTree),
  getRightOperator(SecondTree, Level2),
  getLeftOperator(SecondTree, SecondRoot), /* Prendo chiave root, in questo caso meteo */
  caratteristica(SecondRoot, Valore2),
  findSubTree(Level2, Valore2, ThirdLevel),

  getRightOperator(ThirdLevel, Classe),
  atomic(Classe).

   /* Ottengo meteo esempio */
classe(Albero, Esempio, Classe) :-
  getLeftOperator(Esempio, Data), /* Prendo caratteristiche */
  iterateExamples(Data),

  getRightOperator(Albero, Level1),
  getLeftOperator(Albero, RootKey), /* Prendo chiave root, in questo caso meteo */
  caratteristica(RootKey, Valore),
  findSubTree(Level1, Valore, LowerLevel),

  getRightOperator(LowerLevel, SecondTree),
  getRightOperator(SecondTree, Level2),
  getLeftOperator(SecondTree, SecondRoot), /* Prendo chiave root, in questo caso meteo */
  caratteristica(SecondRoot, Valore2),
  findSubTree(Level2, Valore2, ThirdLevel),

  getRightOperator(ThirdLevel, ThirdTree),
  getRightOperator(ThirdTree, Level3),
  getLeftOperator(ThirdTree, ThirdRoot), /* Prendo chiave root, in questo caso meteo */
  caratteristica(ThirdRoot, Valore3),
  findSubTree(Level3, Valore3, FourthLevel),

  !,
  getRightOperator(FourthLevel, Classe).
