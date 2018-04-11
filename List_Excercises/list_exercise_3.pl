/**
 * Write a predicate second(X,List) which checks whether X is the second element of List .
 */
second([],_).
second([_,X|_],X).
is_second(X,List):-second(List,X).
