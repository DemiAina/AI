% Financial Advisor
% code to get you started

% declare predicates and their arity
% not necessary, but avoids warnings

:- dynamic invest_in/1.
:- dynamic savings_account/1.
:- dynamic amount_saved/1.
:- dynamic dependents/1.
:- dynamic minsavings/2.
:- dynamic earnings/2.
:- dynamic getSavings/0.
:- dynamic getEarnings/0.
:- dynamic getDependents/0.

invest_in(car) :-
    savings_account(adequate), 
    income(adequate),
    dependents(Y), 
    Y > 3.


invest_in(stocks) :-
    savings_account(adequate), income(adequate).

invest_in(combonation) :-
    savings_account(adequate), income(inadequate).

invest_in(savings) :-
    savings_account(inadequate).

% rules 6 & 7
% The next rule uses cut !. The order of the following
% 2 clauses is important. The second one only fires if 
% the first one fails. Does not allow backtracking. 
% Cut ! prevents this.

income(adequate) :- 
    earnings(X,SI),
    dependents(Y),
    minincome(Y, MI),
    X > MI, !.

income(inadequate).


    
minincome(D, I) :-
    I is 15000 + D * 4000.


getSavings :-
    write('Input savings amount '),
    read(S),
    assert(saved(S)).


getDependents :-
    write('Input number of dependents '),
    read(D),
    assert(dependents(D)).

getEarnings :-
    write('Input earnings amount '),
    read(E),
    write('Enter 1 if income is steady, Enter 0 if income is unsteady '),
    read(SI),
    assert(earnings(E,SI)).


% adequacy of savings = 5000 * D
% adequacy of income = 15000 per/yr + (4000 * D)

savings_account(adequate) :- 
    saved(X),
    dependents(Y),
    minsave(Y,MS),
    X > MS, !.

savings_account(inadequate).

minsave(D, I) :-
    I is 5000 * D.

%  go is to run the whole program, makes it easier
go :- getSavings,
      getDependents,
      getEarnings,
      
      invest_in(X),
      write('Advice is to invest in '), write(X), !,
      cleanInputs.

% If the first attempt at go fails, Prolog will 
% backtract and try this instead
go :-
      write('Cannot currently advise you'),
      cleanInputs.


cleanInputs :-
     retractall(amount_saved(_)),
     retractall(saved(_)),
     retractall(dependents(_)),
     retractall(earnings(_,_)).
