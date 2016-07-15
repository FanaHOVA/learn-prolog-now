compareStrings([], [], N, N, M, M).

compareStrings([], A, Nr, N, M, Mr) :-
  length(A, Len),
  N1 is N + Len,
  M1 is M + (Len * 5),
  compareStrings([], [], Nr, N1, M1, Mr).

compareStrings(A, [], Nr, N, M, Mr) :-
  length(A, Len),
  N1 is N + Len,
  M1 is M + (Len * 5),
  compareStrings([], [], Nr, N1, M1, Mr).

compareStrings([H1|T1], [H1|T2], Nr, N, M, Mr) :-
  compareStrings(T1, T2, Nr, N, M, Mr).

compareStrings([H1|T1], [H1], Nr, N, M, Mr) :-
  compareStrings(T1, [], Nr, N, M, Mr).

compareStrings([H1, H2|T1], [H2, H1|T2], Nr, N, M, Mr) :-
  N1 is N+1,
  M1 is M+1,
  compareStrings(T1, T2, Nr, N1, M1, Mr).

compareStrings([H1, _, H3| T1], [H1, H3|T2], Nr, N, M, Mr) :-
  N1 is N + 5,
  M1 is M + 1,
  compareStrings(T1, T2, Nr, N1, M1, Mr).

compareStrings([H1, H3| T1], [H1, _, H3 | T2], Nr, N, M, Mr) :-
  N1 is N + 5,
  M1 is M + 1,
  compareStrings(T1, T2, Nr, N1, M1, Mr).

compareStrings(A, B, Nr, N, M, Mr) :-
  length(B, Len),
  compareStrings(A, [], Nr, N + Len * 5, M + Len, Mr).


distanza(Stringa1,Stringa2,MosseDiTrasformazione,CostoTrasformazione) :-
  string(Stringa1),
  string(Stringa2),
  string_codes(Stringa1, S1L),
  string_codes(Stringa2, S2L),
  !,
  compareStrings(S1L, S2L, CostoTrasformazione, 0, 0, MosseDiTrasformazione).
