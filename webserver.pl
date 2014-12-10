:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(uri)). 

:- use_module(library(http/json)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

:- http_handler(root(hello_world), say_hi, []).
:- http_handler('/find_by_relation', find_by_relation, []).
:- http_handler('/find_by_name', find_by_name, []).

:- consult('graph-utils').

server(Port) :-
    %% load edges from a csv file
    csv_read_file("graph-edges.csv", Rows, [functor(edge), arity(5)]),
    %% trasforming edges to facts
    maplist(assert, Rows),
    http_server(http_dispatch, [port(Port)]).

edge_to_term_json([C1, E1, Rel, C2, E2], json([from=json([class=C1,name=E1]), to=json([class=C2,name=E2]), rel=Rel])).

find_by_relation(Request) :-
    http_parameters(Request,
		    [
		     relation(NameString,   [])
		    ]),
    read_term_from_atom(NameString, Relation, []),
    %% 
    %% previous vertexes
    %%
    find_relations(Relation, Edges),
    maplist(edge_to_term_json, Edges, PE),

    prolog_to_json(json([edges=PE]), Json),
    reply_json(Json).

find_by_name(Request) :-
    http_parameters(Request,
		    [
		     name(NameString,   [])
		    ]),
    read_term_from_atom(NameString, Name, []),
    %% 
    %% previous vertexes
    %%
    prev_vertexes(Name, PrevEdges),
    maplist(edge_to_term_json, PrevEdges, PE),

    %% 
    %% next vertexes
    %%
    next_vertexes(Name, NextEdges),
    maplist(edge_to_term_json, NextEdges, NE),

    prolog_to_json(json([prev=PE,
			 next=NE]), Json),
    reply_json(Json).


