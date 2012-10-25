![D.Labs Toolbox Travis Status](https://secure.travis-ci.org/otobrglez/dlabs-toolbox.png?branch=master)

# D.Labs Toolbox

This GEM provides tools for D.Labs developer.

## Installing

* [Install Ruby](http://www.ruby-lang.org/en/downloads/)
* # gem install dlabs-toolbox
* Create **~/.dlabs-credentials** with content
    DLABS_EMAIL="oto.brglez@dlabs.si"
    DLABS_PASS="..."
* Or set 2 enviroment variables with same content.

## Using **duck** tool

* Finding tasks
    duck task "#350"
* Activities
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

