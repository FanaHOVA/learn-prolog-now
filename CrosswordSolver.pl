word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3) :-
         word(V1, VA, VHB, VC, VHD, VE, VHF, VG),
         word(V2, WA, WHB, WC, WHD, WE, WHF, WG),
         word(V3, XA, XHB, XC, XHD, XE, XHF, XG),
         word(H1, YA, VHB, YC, WHB, YE, XHB, YG),
         word(H2, ZA, VHD, ZC, WHD, ZE, XHD, ZG),
         word(H3, MA, VHF, MC, WHF, ME, XHF, MG).
