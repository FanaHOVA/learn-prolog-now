s --> simple_s.
s --> simple_s, det, simple_s.
simple_s --> np, vp.
np --> det, sogg.
onp --> det, ogg.
vp --> v, onp.

det --> [il].
det --> [mentre].

sogg --> [gatto].
sogg --> [cane].

ogg --> [topo].
ogg --> [cane].

v --> [mangia].

soggetti_verbo(V, Ss) :-
  setof(X, s([il, X, V, _, _], []), Ss),
  !.

oggetti_verbo(V, Os) :-
  setof(X, s([il, _, V, _, X], []), Os),
  !.
