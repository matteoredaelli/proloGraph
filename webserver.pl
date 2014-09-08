:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(uri)). 

:- use_module(library(http/json)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

:- http_handler(root(hello_world), say_hi, []).
:- http_handler('/vertex', show_vertex, []).

:- consult('graph-edges').
:- consult('graph-utils').

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

edge_to_term_json([E1, Rel, E2], json([from=E1A, to=E2A, rel=Rel])) :-
    term_to_atom(E1, E1A),
    term_to_atom(E2, E2A).

show_vertex(Request) :-
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


