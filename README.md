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

	swipl webserver.pl --port=8888

and open the followsing url with your browser

	http://myserver:8888/edges_by_name?name=matteo

The result will be

 {
  "edges": [
    {
      "from": {"name":"matteo"},
      "to": {"name":"ele"},
      "rel":"follows"
    },
    {
      "from": {"name":"matteo"},
      "to": {"name":"italy"},
      "rel":"lives_in"
    },
    {
      "from": {"name":"matteo"},
      "to": {"name":"gabriele"},
      "rel":"follows"
    },
    {
      "from": {"name":"ele"},
      "to": {"name":"matteo"},
      "rel":"follows"
    }
  ]
 }

And

	http://myserver:8888/edges_by_relation?relation=follows

 {
  "edges": [
    {
      "from": {"name":"matteo"},
      "to": {"name":"ele"},
      "rel":"follows"
    },
    {
      "from": {"name":"matteo"},
      "to": {"name":"gabriele"},
      "rel":"follows"
    },
    {
      "from": {"name":"ele"},
      "to": {"name":"gabriele"},
      "rel":"follows"
    },
    {
      "from": {"name":"ele"},
      "to": {"name":"matteo"},
      "rel":"follows"
    }
  ]
 }
