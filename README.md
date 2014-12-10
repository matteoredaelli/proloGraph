proloGraph
==========

A demo for a REST server developed in prolog reading facts from a CSV file

# Usage

Install SWI Prolog, with Linux Debian/Ubuntu just run

	apt-get install swi-prolog

Clone my git repository

	git clone https://github.com/matteoredaelli/proloGraph
	cd proloGraph

Run the server with

	swipl -s webserver.pl -g 'server(8765).'

and open the following url with your browser

	http://gauss.it.pirelli.com:8765/find_by_relation?relation=follow

The result will be

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
