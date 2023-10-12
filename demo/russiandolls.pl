% Knowledge Base
directlyIn(irina, katarina).
directlyIn(katarina, olga).
directlyIn(olga, natasha).

% Recursive Predicate
in(X, Y) :- directlyIn(X, Y).  % Base case: X is directly in Y
in(X, Y) :- directlyIn(X, Z), in(Z, Y).  % Recursive case: X is in some doll Z, and Z is in Y

