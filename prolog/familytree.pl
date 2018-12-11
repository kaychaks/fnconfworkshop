%
% Anne Ogborn family tree
%

% these people are male
male(don).
male(randy).
male(mike).
male(elmer).
male(john_boger).
male(john_shelton).
male(dicky).
male(leslie).

% and the females
female(anne).
female(rosie).
female(esther).
female(mildred).
female(dianne).
female(stacey).
female(calley).

parent(don,anne).
parent(don,randy).
parent(don,mike).
parent(rosie,anne).
parent(rosie,randy).
parent(rosie,mike).
parent(mike,calley).
parent(stacey,calley).
parent(elmer,don).
parent(mildred,don).
parent(john_shelton, rosie).
parent(esther, rosie).
parent(john_shelton, dicky).
parent(esther, dicky).

brother_of(X,Y) :-
    male(X),
    parent(Parent, X),
    parent(Parent, Y).

mother_of(Mom, Child) :-
    female(Mom),
    parent(Mom, Child).

ancestor(X,Y) :-
    parent(X,Y).
ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y).

% problems - conflates brother and half brother
% leslie is esther's brother, but I don't know esther's parents names
% randy's kids not included, how do we know who married who?
% who'se john boger? (my grandma esther remarried after mr kreb's death)


