:- module(adultschildren, [go/0]).
/** <module> work the adults-children-dog river problem
 *
 * 3 adults, 2 children, and a dog are on the left bank of
 * a river.  They want to cross to the right side.
 *
 * They have a tiny boat that can hold one adult, or one or two
 * children, or a child and a dog.  There must be a human in the
 * boat to paddle.
 *
 */
go :-
    adults_child_dog(3, 2, 1, left, [3-2-1-left], Moves),
    print_moves(Moves).

print_arg(X + Y) :-
    format("~w ~w~n", [X,Y]).

adults_child_dog(0, 0, 0, right, _, []) :- !. % done!
adults_child_dog(A, C, D, left, SoFar, [BA-BC-BD-to_right | Rest]) :-
    boat_left(BA, BC, BD),
    BA =< A,    % have enough people to do it
    BC =< C,
    BD =< D,
    NA is A - BA,
    NC is C - BC,
    ND is D - BD,
    \+ member(NA-NC-ND-right, SoFar),
    adults_child_dog(NA, NC, ND, right, [NA-NC-ND-right| SoFar], Rest).
adults_child_dog(A, C, D, right, SoFar, [BA-BC-BD-to_left | Rest]) :-
    boat_right(BA, BC, BD),
    BA =< 3 - A,    % have enough people to do it
    BC =< 2 - C,
    BD =< 1 - D,
    NA is A + BA,
    NC is C + BC,
    ND is D + BD,
    \+ member(NA-NC-ND-left, SoFar),
    adults_child_dog(NA, NC, ND, left, [NA-NC-ND-left |SoFar], Rest).

% moves with boat on left bank
boat_left(1, 0, 0).
boat_left(1, 1, 0).
boat_left(0, 2, 0).
boat_left(0, 1, 0).
boat_left(0, 1, 1).

% moves with boat on right bank
% no point in returning adults or dog to left bank
boat_right(0, 1, 0).
boat_right(0, 2, 0).

print_moves([]).
print_moves([A-C-D-to_right | Rest]) :-
    format('~w adults ~w children ~w dogs to right bank~n', [A,C,D]),
    print_moves(Rest).
print_moves([A-C-D-to_left | Rest]) :-
    format('~w adults ~w children ~w dogs to left bank~n', [A,C,D]),
    print_moves(Rest).













