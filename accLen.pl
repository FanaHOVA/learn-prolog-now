accLen([], A, A).
accLen([_|T], Acc, Length) :- NewAcc is Acc + 1,
                              accLen(T, NewAcc, Length).

length(List, Length) :- accLen(List, 0, Length).
