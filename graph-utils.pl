next_vertexes(Vertex, L) :-
    findall([Class, Vertex, Relation, OtherClass, OtherVertex], 
	    edge(Class, Vertex, Relation, OtherClass, OtherVertex), L).

prev_vertexes(Vertex, L) :-
    findall([OtherClass, OtherVertex, Relation, Class, Vertex], 
	    edge(OtherClass, OtherVertex, Relation, Class, Vertex), L).

find_relations(Relation, L) :-
    findall([Class, Vertex, Relation, OtherClass, OtherVertex], 
	    edge(Class, Vertex, Relation, OtherClass, OtherVertex), L).
