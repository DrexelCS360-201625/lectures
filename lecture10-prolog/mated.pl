father(grampa,homer).
father(homer,bart).
father(homer,lisa).
father(homer,maggie).
mother(marge,bart).
mother(marge,lisa).
mother(marge,maggie).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

/* Define a predicate mated(X,Y) that holds when X and Y are both parents of the
same person */
