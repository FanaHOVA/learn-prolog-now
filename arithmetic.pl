increment(A, B) :- A is B - 1.

sum(A, B, C) :- C is A + B.

addone2([H|T], [Ih|It]) :-
    Ih is H + 1,
    addone2(T, It).

addone2([], []).
