proloGraph
==========

A demo for a REST server developed in prolog

# Usage

Install SWI Prolog, with Linux Debian/Ubuntu just run

	apt-get install swi-prolog

Run the server with

	swipl -s webserver.pl -g 'server(8765).'

and open the following url with your browser

	http://localhost:8765/vertex?name=user(matteo)

The result will be

Sometimes ago I read that some components of IBM Watson were implemented in prolog . So I decided to look at it again after many years... I like Prolog, I studied prolog at Computer Science University of Milan and for my thesis I wrote code in Prolog (and Lisp).

proloGraph is a simple example of howto exposing a prolog graph database to other applications,  building a REST web service. I used swi-prolog and its http library

Install the prolog language (I used the fantastic Linux Debian distribution) with

apt-get install swi-prolog

clone my git repository

git clone https://github.com/matteoredaelli/proloGraph
cd proloGraph

Run it with

swipl -s webserver.pl -g 'server(8765).'

Open the following url with your browser

http://localhost:8765/vertex?name=user(1)

and you will get:

	{
	  "prev": [ {"from":"user(gabriele)", "to":"user(matteo)", "rel":"follow"} ],
	  "next": [
	    {"from":"user(matteo)", "to":"user(ele)", "rel":"follow"},
	    {"from":"user(matteo)", "to":"user(gabriele)", "rel":"follow"},
	    {"from":"user(matteo)", "to":"user(4)", "rel":"follow"},
	    {"from":"user(matteo)", "to":"country(italy)", "rel":"lives"},
	    {"from":"user(matteo)", "to":"hobby(running)", "rel":"likes"}
	  ]
	}	
