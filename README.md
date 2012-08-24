###Overview

This project will build and start [doula](https://github.com/Doula/Doula) and [bambino](https://github.com/Doula/Bambino) on a macbook pro with iTerm 2.  It does the following:

* makes a virtualenv
* activates it
* pip installs doula and bambino to `src/doula` and `src/bambino`
* creates an `/opt/webapp` dir
* creates a `/etc/supervisor/conf.d` dir
* `chown`s both
* loops through all the appenvs in [fake appenvs](http://code.corp.surveymonkey.com/doula)
* clones them
* inits and pulls the `etc` project
* creates and symlinks the `supervisor.conf` in each project to `/etc/supervisor/conf.d/x.conf`

then it runs an applescript that

* opens 3 terminals, starting doula, bambino, and queue
* opens a Chrome tab to localhost:6543

###To Install

Installation happens relative to where you run the `setup.sh`, the instructions below run it from `~/Sites/doula`, but you can run it anywhere.

    mkdir ~/Sites/doula
    git clone git@github.com:Doula/local_build.git
    ./setup.sh
    
  