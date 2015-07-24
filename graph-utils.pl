next_vertices(Name, L) :-
    findall([Name, Relation, OtherName], 
	    edge(Name, Relation, OtherName), L).

prev_vertices(Name, L) :-
    findall([OtherName, Relation, Name], 
	    edge(OtherName, Relation, Name), L).

edges_by_relation(Relation, L) :-
    findall([Name, Relation, OtherName], 
	    edge(Name, Relation, OtherName), L).

edges_by_name(Name, L) :-
    next_vertices(Name, L1),
    prev_vertices(Name, L2),
    append([L1,L2], LL),
    list_to_set(LL, L).

vertices_from_edges([],[]).
vertices_from_edges(V,[Name|L]) :-
    vertices_from_edges(V1,L),
    list_to_set(V1, [Name], V).
    

vertices_by_name(Name, L) :-
    edges_by_name(Name, L1),
    list_to_set(L1, L).

