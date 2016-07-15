accMax([H|T], A, Max) :-
    H > A,
    accMax(T, H, Max).

accMax([H|T], A, Max) :-
    H <= A,
    accMax(T, A, Max).

accMax([], A, A).

maxItem(List, Max) :- List = [H|T],
                      accMax(T, H, Max).
