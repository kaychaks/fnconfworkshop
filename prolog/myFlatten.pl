mflatten([],[]) :- !.
mflatten([X | XS], [X | Rest]) :-
    \+ is_list(X),
    mflatten(XS, Rest).
mflatten([X | XS], Y) :-
    is_list(X),
    mflatten(X,First),
    mflatten(XS,Rest),
    append(First, Rest, Y).

:- op(400, xfx, complex_is).

complex_is(comp(R,0),R) :-
    number(R), !.

complex_is(comp(R,I),comp(R, I)).

complex_is(Res,A + B) :-
    complex_is(comp(RA,IA), A),
    complex_is(comp(RB,IB),B),
    TotalR is RA + RB,
    TotalI is IA + IB,
    Res = comp(TotalR,TotalI).

complex_is(Res,A * B) :-
    complex_is(comp(RA,IA), A),
    complex_is(comp(RB,IB),B),
    TotalR is (RA * RB) - (IA * IB),
    TotalI is (RA * IB) + (IA * RB),
    Res = comp(TotalR,TotalI).
