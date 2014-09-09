proloGraph
==========

A demo for a REST server developed in prolog

# Usage

Install SWI Prolog, with Linux Debian/Ubuntu just run

	apt-get install swi-prolog

Clone my git repository

	git clone https://github.com/matteoredaelli/proloGraph
	cd proloGraph

Run the server with

	swipl -s webserver.pl -g 'server(8765).'

and open the following url with your browser

	http://localhost:8765/vertex?name=user(matteo)

The result will be

	{
	  "prev": [ {"from":"user(gabriele)", "to":"user(matteo)", "rel":"follow"} ],
	  "next": [
	    {"from":"user(matteo)", "to":"user(ele)", "rel":"follow"},
	    {"from":"user(matteo)", "to":"user(gabriele)", "rel":"follow"},
	    {"from":"user(matteo)", "to":"user(nico)", "rel":"follow"},
	    {"from":"user(matteo)", "to":"country(italy)", "rel":"lives"},
	    {"from":"user(matteo)", "to":"hobby(running)", "rel":"likes"}
	  ]
	}	
