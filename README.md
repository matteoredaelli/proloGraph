proloGraph
==========

A demo for a REST server developed in prolog

# Usage

Install SWI Prolog, with Linux Debian/Ubuntu just run

	apt-get install swi-prolog

Run the server with

	swipl -s webserver.pl -g 'server(8765).'

and open the following url with your browser

	http://localhost:8765/vertex?name=user(1)

The result will be

	{
	  "prev": [ {"from":"user(3)", "to":"user(1)", "rel":"follow"} ],
	  "next": [
	    {"from":"user(1)", "to":"user(2)", "rel":"follow"},
	    {"from":"user(1)", "to":"user(3)", "rel":"follow"},
	    {"from":"user(1)", "to":"user(4)", "rel":"follow"},
	    {"from":"user(1)", "to":"country(italy)", "rel":"lives"},
	    {"from":"user(1)", "to":"hobby(running)", "rel":"likes"}
	  ]
	}
	
