 %Exercise  5.2

  %  Define a 2-place predicate increment that holds only when its second 
%	argument is an integer one larger than its first argument. 
%	For example, increment(4,5) should hold, but increment(4,6) should not.
 %   Define a 3-place predicate sum that holds only when its third argument 
	%is the sum of the first two arguments. For example, sum(4,5,9) should hold, but sum(4,6,12) should not.

increment(X, Y) :- Y is X + 1.

sum(X, Y, Z) :- Z is X + Y.

 %Exercise  5.3 Write a predicate addone/2 whose first argument is a list of integers, and whose 
 %second argument is the list of integers obtained by adding 1 to each integer in the first list.
 
addone([], []). 
addone([H|T], [H1|T1]) :- H1 is H + 1, addone(T, T1).

% Exercise  6.1 Let’s call a list doubled if it is made of two consecutive blocks of elements that are exactly the same. 
% For example, [a,b,c,a,b,c] is doubled (it’s made up of [a,b,c] followed by [a,b,c] ) and so is [foo,gubble,foo,gubble] . 
% On the other hand, [foo,gubble,foo] is not doubled. Write a predicate doubled(List) which succeeds when List is a doubled list. 

doubled(L) :- length(L, 2), !, append(H, H, L).
doubled(L) :- length(L, X), X mod 2 =:= 0, append(L1, L2, L),  length(L1, X1), X1 is X//2,
				L1 = [H1|T1], L2 = [H2|T2], doubled([H1, H2]), append(T1, T2, T), doubled(T).
				
 %Exercise  6.2 A palindrome is a word or phrase that spells the same forwards and backwards. 
 %For example, ‘rotator’, ‘eve’, and ‘nurses run’ are all palindromes. 
 %Write a predicate palindrome(List) , which checks whether List is a palindrome. 
 
 palindrome(L) :- inv(L, [], R), append(L, R, X), doubled(X), !.
 
 inv([], A, A).
 inv([H|T], A, R) :- inv(T, [H|A], R).
 
 
%  Exercise  6.3 Write a predicate toptail(InList,OutList) which says no if InList is a list containing fewer than 2 elements,
%  and which deletes the first and the last elements of InList and returns the result as OutList ,
%  when InList is a list containing at least 2 elements.
  
  toptail(In, Out):- length(In, X), X < 2, write("no"), !.
  toptail(In, Out):- length(In, X), X >= 2, In = [H|T],
						inv(T, [], R), R = [H2|X2], inv(X2, [], Out).


last([], _) :- fail.
last(L, X) :- inv(L, [], [H|T]), H = X.

last2([X], X) :- !.
last2([H|T], X) :- last2(T, X).

swapfl([H|T], [H2|T2]) :- igualenmen(T,T2), inv([H|T], [], [H3|T3]), H3 = H2, 
						  inv([H2|T2], [], [H4|T4]), H4 = H. 

igualenmen([H], [H2]).
igualenmen([H|T], [H2|T2]) :- H = H2, igualenmen(T, T2).