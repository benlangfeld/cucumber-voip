cucumber-voip
===========

Automated functional testing of voice applications is typically difficult and expensive. Not so when we can specify our systems using Cucumber. cucumber-voip provides a powerful set of features based on Punchblock and rspec-rayo which allow you, using the Rayo protocol, to drive a voice application using plain English Cucumber scenarios as if you're the end user.

Features
--------

* Rayo connection manager and Cucumber step definitions for common functional testing scenarios

Requirements
------------

* A Rayo server, eg rayo-server on Voxeo PRISM

Install
-------

    gem install cucumber-voip FIXME (gem install, anything else)

Examples
--------

See the features/ directory

Author
------

Original author: Ben Langfeld

Links
-----
* [Source](https://github.com/benlangfeld/cucumber-voip)
* [Documentation](http://rdoc.info/github/benlangfeld/cucumber-voip/master/frames)
* [Bug Tracker](https://github.com/benlangfeld/cucumber-voip/issues)

TODO
----

There is a huge list of things that need to be done in order for this project to be more useful:

* Internal features should run against a known script for each scenario
* A whole bunch more step definitions need to be added
* Generators should be provided for in-app and standalone usage
* A boat-load of documentation is required on the following topics:
** How to setup cucumber-voip in your application or stand-alone
** How to write features
** How to write extra step definitions

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2011 Ben Langfeld. MIT licence (see LICENSE for details).
