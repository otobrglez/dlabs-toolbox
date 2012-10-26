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

## Tools

* duck - Simple console application for reporting and time tracking.

## Using **duck**

### Finding task
	duck "the project i'm looking for..."

### Project details
	duck my_project

### Task details
	duck my_project/1234
    
### Adding time to project
	duck my_project/1234 +1h Working on this task of mine
    duck my_project/3232 +1:30 Adding hour and 30 minutes
    duck my_project/1223 +45m Working for 45

### Listing activities
    duck a							# My activities
	duck a today					# My todays activities
    duck a 2012-31-12				# My activities on day 2012-31-12
    duck a 2012-01-01 2012-31-12	# Activities between this two dates

### Taking to developers (sending single quack)
	duck q oto.brglez "Please call me, maybe."

### Talking to developer (person 2 person chat)
	duck q oto.brglez
    
### Talking to all developers (group chat)
	duck q
    
## Contributing to dlabs-toolbox

* Clone
* Make branch
* Push branch
* Make pull request

