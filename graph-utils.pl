next_vertexes(Vertex, L) :-
    findall([Vertex, Relation, OtherVertex], 
	    edge(Vertex, OtherVertex, Relation), L).

prev_vertexes(Vertex, L) :-
    findall([OtherVertex, Relation, Vertex], 
	    edge(OtherVertex, Vertex, Relation), L).
