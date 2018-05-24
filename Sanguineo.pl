padrede('Emiliano','Paula').
padrede('Jose','Emiliano').
padrede('Emiliano','Jairo').
padrede('Emiliano','Richi').
padrede('Richi','Sofi').
padrede('Jose','Lucio').
padrede('Lucio','Sebastian').

hijode(A,B) :- padrede(B,A).
abuelode(A,B) :- padrede(C,B),padrede(A,C).
nietode(A,B):- padrede(C,A),padrede(B,C).
hermano(A,B) :- padrede(C,A),padrede(C,B), A\=B.
tiode(A,B) :- hermanode(A,C), padrede(C,B).
sobrinode(A,B) :- hermanode(A,C), padrede(C,B).
primode(A,B):- padrede(C,A),hermanode(C,D),padrede(D,B).
bisabuelode(A,B):-hijode(B,C),abuelo(C,A).
bisnietode(A,B):-padrede(C,A),padrede(D,C),padrede(B,D).



familiarde(A,B) :- padrede(A,B).
familiarde(A,B) :- hijode(A,B).
familiarde(A,B) :- abuelode(A,B).
familiarde(A,B) :- hermanode(A,B).
familiarde(A,B) :- tiode(A,B).
familiarde(A,B) :- sobrinode(A,B).
familiarde(A,B) :- bisabuelode(A,B).
familiarde(A,B) :- bisnietode(A,B).
familiarde(A,B) :- primode(A,B).
familiarde(A,B) :- nietode(A,B).
