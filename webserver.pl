:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_unix_daemon)).

:- use_module(library(http/json)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

:- use_module(library(uri)). 

:- http_handler(root(hello_world), say_hi, []).
:- http_handler('/edges_by_relation', edges_by_relation, []).
:- http_handler('/edges_by_relation_post', edges_by_relation_post, []).
:- http_handler('/edges_by_name', edges_by_name, []).
:- http_handler('/edges_by_name_post', edges_by_name_post, []).

:- initialization http_daemon.
:- consult('graph-utils').

:-  csv_read_file("graph-edges.csv", Rows, [functor(edge), arity(3)]), maplist(assert, Rows).

edge_to_term_json([E1, Rel, E2], json([from=json([name=E1]), to=json([name=E2]), rel=Rel])).

edges_by_name_post(Request) :-
    member(method(post), Request), !,
    http_read_data(Request, [name=Name], []),
    edges_by_name(Name, Edges),
    maplist(edge_to_term_json, Edges, PE),
    prolog_to_json(json([edges=PE]), Json),
    reply_json(Json).

edges_by_relation_post(Request) :-
    member(method(post), Request), !,
    http_read_data(Request, [relation=Relation], []),
    %% 
    %%
    edges_by_relation(Relation, Edges),
    maplist(edge_to_term_json, Edges, PE),
    prolog_to_json(json([edges=PE]), Json),
    reply_json(Json).

edges_by_name(Request) :-
    http_parameters(Request,
		    [
		     name(NameString,   [])
		    ]),
    read_term_from_atom(NameString, Name, []),
    %% 
    %%
    edges_by_name(Name, Edges),
    maplist(edge_to_term_json, Edges, PE),

    prolog_to_json(json([edges=PE]), Json),
    reply_json(Json).

edges_by_relation(Request) :-
    http_parameters(Request,
		    [
		     relation(NameString,   [])
		    ]),
    read_term_from_atom(NameString, Relation, []),
    %% 
    %%
    edges_by_relation(Relation, Edges),
    maplist(edge_to_term_json, Edges, PE),

    prolog_to_json(json([edges=PE]), Json),
    reply_json(Json).

