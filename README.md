proloGraph
==========

A demo for a REST server developed in prolog reading facts from a CSV file

# Usage

Install SWI Prolog, with Linux Debian/Ubuntu just run

	apt-get install swi-prolog

Clone my git repository

	git clone https://github.com/matteoredaelli/proloGraph
	cd proloGraph
	mv graph-edges.csv.sample graph-edges.csv

Run the server with

	swipl -s webserver.pl -g 'server(8765).'

and open the following url with your browser

	http://myserver:8765/edges_by_class_name?class=user&name=matteo

The result will be

 {
  "prev": [
    {
      "from": {"class":"user", "name":"ele"},
      "to": {"class":"user", "name":"matteo"},
      "rel":"follow"
    }
  ],
  "next": [
    {
      "from": {"class":"user", "name":"matteo"},
      "to": {"class":"user", "name":"ele"},
      "rel":"follow"
    },
    {
      "from": {"class":"user", "name":"matteo"},
      "to": {"class":"country", "name":"italy"},
      "rel":"lives_in"
    },
    {
      "from": {"class":"user", "name":"matteo"},
      "to": {"class":"user", "name":"gabriele"},
      "rel":"follow"
    }
  ]
 }


And

	http://gauss.it.pirelli.com:8765/edges_by_relation?relation=follow

 {
  "edges": [
    {
      "from": {"class":"user", "name":"matteo"},
      "to": {"class":"user", "name":"ele"},
      "rel":"follow"
    },
    {
      "from": {"class":"user", "name":"matteo"},
      "to": {"class":"user", "name":"gabriele"},
      "rel":"follow"
    },
    {
      "from": {"class":"user", "name":"ele"},
      "to": {"class":"user", "name":"gabriele"},
      "rel":"follow"
    },
    {
      "from": {"class":"user", "name":"ele"},
      "to": {"class":"user", "name":"matteo"},
      "rel":"follow"
    }
  ]
 }
