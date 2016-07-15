no_common_elements([], []).
no_common_elements([H1|T1], [H2|T2]) :- !, no_common_elements(T1, T2).
no_common_elements([H1|_], [H1|_]) :- !, fail.
