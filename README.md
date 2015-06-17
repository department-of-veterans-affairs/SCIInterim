SCI Interim
=================

*Data entry and records application for Spinal Care Injuries at Veterans Affairs*

[![Build Status](https://travis-ci.org/awong-dev/SCIInterim.svg?branch=enable_travis)](https://travis-ci.org/awong-dev/SCIInterim)
[![Coverage Status](https://coveralls.io/repos/awong-dev/SCIInterim/badge.svg)](https://coveralls.io/r/awong-dev/SCIInterim)

How to get started hacking
==========================

There are 2 steps:
  1. Setting up postgres
  2. Setting up rails

postgres Setup
-----------
Install the postgres binary somehow. For Mac, use Homebrew and run `brew install postgres`. For Linux, use your package manager. You're on your own for windows.

If this is the inital setup of postgres, you must create the database files, create the initial user, etc. Executing

```
rake pg:first_run
```

will do all of the above including seeding the database. Notice the `pg` is not `db`.

If this is not the first run, then you may need to start/stop the database process by doing
some combination of
```
rake pg:start
rake pg:stop
```

This rake script runs a postgres instance under your current user. If you have a system postgres daemon, parts of this might not work.

Rails Setup
-----------
  * bundle install
  * rails s
  * guard  # Use this to auto-run affected specs as you change code.

Useful Links
-----------
Install PostgreSQL: https://www.codefellows.org/blog/three-battle-tested-ways-to-install-postgresql
Install Ruby On Rails on Mac: http://railsapps.github.io/installrubyonrails-mac.html
