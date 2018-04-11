
substitute(  Term,  Term,  Terml,  Terml)  :-  !.

substitute(_,  Term,_,  Term):-atomic( Term),  !.

substitute( Sub, Term,  Subl,  Terml)  :- Term =.. [F|Args], substlist(  Sub,  Args,  Subl, Argsl), Terml =.. [F|Argsl].

substlist(_,[],_,[]).

substlist(Sub,[Term|Terms],Subl,[Terml|Termsl]):- substitute(  Sub,  Term, Subl, Terml), substlist(  Sub,  Terms,  Subl, Termsl).