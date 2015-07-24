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

and open the followsing url with your browser

	http://myserver:8765/edges_by_name?name=/user/matteo

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
      "to": {"name":"/country/italy"},
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

	http://myserver:8765/edges_by_relation?relation=follows

 {
  "edges": [
    {
      "from": {"name":"/user/matteo"},
      "to": {"name":"/user/ele"},
      "rel":"follows"
    },
    {
      "from": {"name":"/user/matteo"},
      "to": {"name":"/user/gabriele"},
      "rel":"follows"
    },
    {
      "from": {"name":"/user/ele"},
      "to": {"name":"/user/gabriele"},
      "rel":"follows"
    },
    {
      "from": {"name":"/user/ele"},
      "to": {"name":"/user/matteo"},
      "rel":"follows"
    }
  ]
 }
