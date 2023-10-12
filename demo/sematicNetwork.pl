% Semantic Network example 1 in Prolog
% with some inference rules for navigating the knowledge network


is_a(cat, mammal).
is_a(bear, mammal).
is_a(mammal, animal).
is_a(fish, animal).
is_a(whale, mammal).
is_a(trout, fish).



lays_eggs(monotreme).
gives_birth(mammal).
reproductive_system(X, lays_eggs) :- isa(X, monotreme).
reproductive_system(X, gives_birth) :- isa(X, mammal).

has(cat, fur).
has(bear, fur).
has(mammal, verebra).

lives_in(fish, water).
lives_in(whale, water).

isa(A,B) :- is_a(A,B).
isa(A,B) :- is_a(A,C), isa(C,B).

has(A,B) :- isa(A,C), has(C,B).
lives_in(A,B) :- isa(A,C), lives_in(C, B).


instance(tommy, bear).
instance(moby, whale).
is_a(X,Y) :-instance(X,Y).
