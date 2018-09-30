# README

## Ensemble

A rails mobile only app built for musicians to track and store iterations of songs. Has authentication and authorization, allows users to join bands, create song repos, and upload song iterations.

## Technology used

* Rails 5.1.6
* Ruby 2.4+
* Postgresql
* Active Record
* Rspec/Capybara
* Bootstrap/SCSS

## Setup

To setup database (which includes a seed file):

```
$ rake db:{drop,create,migrate,seed}
```

To run the test suite:

```
$ bundle
$ rspec
```

### other things!

You can view the deployed app at: https://music-ensemble.herokuapp.com/

If you notice any game breaking errors, please let me know at keegan.rw.corrigan@gmail.com

Thanks for checking it out!
