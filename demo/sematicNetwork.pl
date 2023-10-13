% Semantic Network example 1 in Prolog
% with some inference rules for navigating the knowledge network
%all Animals
is_a(mammal, animal).
is_a(cat, mammal).
is_a(bear, mammal).
is_a(whale, mammal).
is_a(deer, mammal).

%all Fish
is_a(fish, animal).
is_a(trout, fish).
is_a(cod, fish).

%all Reptiles
is_a(reptile, animal).
is_a(snake, reptile).
is_a(crocodile, reptile).

%all Bird
is_a(bird, animal).
is_a(pigeon, bird).
is_a(crow, bird).

%Reproduce 
reproduces(mammal, live_birth).
reproduces(bird, eggs).
reproduces(reptile, eggs).
reproduces(fish, eggs).


%---All Attributes Starts here---
%all fur
has(cat, fur).
has(bear, fur).

%deer
has(deer, cloven_hooves).   
has(cervidae, antlers).   

% Specific Families of deer
is_a(cervidae, mammal).
is_a(white_tailed_deer, cervidae).
is_a(mule_deer, cervidae).
is_a(red_deer, cervidae).   

%all scales
has(reptile, scales).

%all vertebra
has(mammal, vertebra).
has(bird, vertebra).

%all feathers
has(bird, feathers).

%all flys
can_fly(bird, flight).
%---All Attributes Ends here---

% All lives in
lives_in(reptile, land).
lives_in(bird, land).
lives_in(fish, water).
lives_in(whale, water).

%eats
eats(bear, berries).
eats(bear, fish).
eats(cat, meat).
eats(whale, krill).
eats(trout, insects).
eats(cod, fish).
eats(snake, mammals).
eats(crocodile, fish).
eats(pigeon, seeds).
eats(crow, insects).


isa(A,B) :- is_a(A,B).
isa(A,B) :- is_a(A,C), isa(C,B).

has(A,B) :- isa(A,C), has(C,B).
lives_in(A,B) :- isa(A,C), lives_in(C, B).

%Reproductive system
reproduces(mammal,live_birth).
reproduces(bird,eggs).
reproduces(reptile,eggs).
reproduces(fish,eggs).

instance(tommy, bear).
instance(moby, whale).
is_a(X, Y) :- instance(X, Y).
