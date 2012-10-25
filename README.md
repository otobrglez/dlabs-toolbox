![D.Labs Toolbox Travis Status](https://secure.travis-ci.org/otobrglez/dlabs-toolbox.png?branch=master)

# D.Labs Toolbox

This GEM provides tools for D.Labs developer.

## Installing

* [Install Ruby](http://www.ruby-lang.org/en/downloads/)
* Install dlabs-toolbox gem

		gem install dlabs-toolbox

* Create **~/.dlabs-credentials** with content

		DLABS_EMAIL="oto.brglez@dlabs.si"
		DLABS_PASS="..."

* *Or set 2 enviroment variables with same content.*

## Using **fish** tool

**fish** is interactive REPL console that enables you to work dynamicaly with other dlabs-toolbox tools.

Example session with fish:

    $ ./bin/fish
    fish: duck --help
    Usage: duck <method> <option>

    Methods: tickets_find, find_tickets

      -h, --help      Show this message.
    fish:
    fish: duck find_tickets #1347
    <project_1>/#1347 Lorem ....
    <project_2>/#1347 .. ... ....
    fish: duck find_tickets #1000
    <project_5>/#1000 .. ... ... project_5
    <project_1>/#1000 ... ... .....
    <project_2>/#1000 .... ...
    fish:
    fish: duck find_tickets <project_5> #1000
    <project_5>/#1000 .. ... ... project_5
    fish: exit

Piping results to fish:

    $ echo "duck find_tickets project_5 #1000" | ./bin/fish | grep -i "project_5\/"
    <project_5>/#1000 .. ... ... project_5

## Using **duck** tool

Listing tasks

		duck task "#350"

Listing activities

		duck activities
		duck activities --user oto.brglez@dlabs.si
		duck activities --project "Name of the project"
		duck activities --between 2012-01-01 2012-12-31
		duck activities --user oto.brglez@dlabs.si --between 2012-01-01 2012-12-31

## Tools

* duck - Simple console application for reporting and time tracking.

## Contributing to dlabs-toolbox

* Clone
* Make branch
* Push branch
* Make pull request

