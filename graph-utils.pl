next_vertices(Class, Name, L) :-
    findall([Class, Name, Relation, OtherClass, OtherName], 
	    edge(Class, Name, Relation, OtherClass, OtherName), L).

prev_vertices(Class, Name, L) :-
    findall([OtherClass, OtherName, Relation, Class, Name], 
	    edge(OtherClass, OtherName, Relation, Class, Name), L).

edges_by_relation(Relation, L) :-
    findall([Class, Name, Relation, OtherClass, OtherName], 
	    edge(Class, Name, Relation, OtherClass, OtherName), L).

edges_by_name(Name, L) :-
    next_vertices(_Class1, Name, L1),
    prev_vertices(_Class2, Name, L2),
    append([L1,L2], LL),
    list_to_set(LL, L).

vertices_from_edges([],[]).
vertices_from_edges(V,[[Class,Name]|L]) :-
    vertices_from_edges(V1,L),
    list_to_set(V1, [[Class,Name]], V).
    

vertices_by_name(Name, L) :-
    edges_by_name(Name, L1),
    list_to_set(L1, L).

