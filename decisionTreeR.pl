iterateExamples([]).
iterateExamples([H1|T1]) :- assert(H1), iterateExamples(T1).

getRightOperator(Albero, L) :- arg(2, Albero, L).
getLeftOperator(Albero, R) :- arg(1, Albero, R).

findSubTree([FirstSub|List], Key, FirstSub) :-
  arg(1, FirstSub, Key).

findSubTree([H|T], Key, Result) :- findSubTree(T, Key, Result).

iterateArray([H|T], Classe) :-
  getRightOperator(H, Classe),
  getLeftOperator(H, Caratteristica),
  atomic(Classe),
  caratteristica(_, Caratteristica).

iterateArray([H|T], Classe) :-
  getRightOperator(H, Value),
  atomic(Value),
  iterateArray(T, Classe).

iterateArray([H|T], Classe) :-
  getRightOperator(H, Albero),
  iterateTree(Albero, Classe).

iterateTree(Albero, Classe) :-
  getRightOperator(Albero, Level1),
  functor(Level1, F, A),
  F = albero,
  getLeftOperator(Albero, RootKey),
  caratteristica(RootKey, Valore),
  findSubTree(Level1, Valore, LowerLevel),
  iterateTree(LowerLevel, Classe).

iterateTree(Albero, Classe) :-
  getRightOperator(Albero, Level1),
  functor(Level1, F, A),
  F = '[|]',
  iterateArray(Level1, Classe).

classe(Albero, Esempio, Classe) :-
  getLeftOperator(Esempio, Data),
  iterateExamples(Data),

  iterateTree(Albero, Classe).
