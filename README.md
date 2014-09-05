proloGraph
==========

A demo for a REST server developed in prolog

# Usage

swipl -s webserver.pl -g 'server(8765).'

http://localhost:8765/vertex?name=user(1)

 user(3) follow user(1)
 user(1) follow user(2)
 user(1) follow user(3)
 user(1) follow user(4)
 user(1) lives country(italy)
 user(1) likes hobby(running)