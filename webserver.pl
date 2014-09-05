:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(uri)). 

:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).

:- http_handler(root(hello_world), say_hi, []).
:- http_handler('/vertex', show_vertex, []).

:- consult('graph-edges').
:- consult('graph-utils').

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

edge_to_term([E1, Rel, E2], T) :-
    term_to_atom(E1, E1A),
    term_to_atom(E2, E2A),
    atomic_list_concat([E1A, Rel, E2A], ' ', T).

show_vertex(Request) :-
    format('Content-type: text/plain~n~n'),
    http_parameters(Request,
		    [
		     name(NameString,   [])
		    ]),
    read_term_from_atom(NameString, Name, []),
    %% 
    %% previous vertexes
    %%
    prev_vertexes(Name, PrevEdges),
    maplist(edge_to_term, PrevEdges, PE),
    atomic_list_concat(PE, '~n', PEL),
    format(PEL),
    format('~n'),
    %% 
    %% next vertexes
    %%
    next_vertexes(Name, NextEdges),
    maplist(edge_to_term, NextEdges, NE),
    atomic_list_concat(NE, '~n', NEL),
    format(NEL).
