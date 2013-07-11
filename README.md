# PSA

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'PSA'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install PSA

## Usage
   
    GIJoe = Intercom::PSA.new("http://intercom.herokuapps.com")
    GIJoe.broadcast("Knowing is half the battle")

or

    GIJoe.broadcast("Knowing is half the battle","Ralph")

or simply

    GIJoe.ralph("Knowing is half the battle")

and also

    GIJoe.alert(10) #alerts for 10 seconds -ish