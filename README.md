bcryphtuby
==========

A thin CLI wrapper around bcrypt-ruby, and then a thin PHP wrapper around that.

    # procure
    git clone git://github.com/pda/bcryphtuby.git
    bundle install  # bcrypt-ruby, rspec
    rake spec

    # wield
    ruby bcrypt-cli hash blarg                      # $2a$10$w8Y4...
    ruby bcrypt-cli compare '$2a$10$w8Y4...' blarg  # true
    ruby bcrypt-cli compare '$2a$10$w8Y4...' meh    # false

    # mash into PHP
    require_once('bcrypt.php');
    $hash = Bcrypt::hash('test');    // string(60) "$2a$10$HdyP..."
    Bcrypt::compare($hash, 'wrong'); // bool(false)
    Bcrypt::compare($hash, 'test');  // bool(true)

(You might need -rubygems on those ruby commands...)

Good god, why??
---------------

During transition of a project from PHP to Ruby, I need to create new user accounts using decent password hashing that will not be regretted later.  Bcrypt rocks.  PHP doesn't.


Why such a terrible name?
-------------------------

I've taken a beautiful Ruby gem, trapped it in a mediocre CLI wrapper, and then wrapped that in horrible PHP.
It deserves a bad name.


Doesn't PHP already support bcrypt?
-----------------------------------

The short answer is no.
The long answer involves version numbers and unofficial "security" patches.
The medium answer is that it doesn't support it in my transitional production environment.


How's it looking?
-----------------

    ruby CLI interface to bcrypt-ruby
      the hash command
        outputs a string
        outputs a string with valid prefix
        outputs a string of the correct length
      the compare command
        outputs true for valid comparison
        outputs false for invalid comparison
    
    php CLI interface to bcrypt-ruby
      the hash command
        outputs a string
        outputs a string with valid prefix
        outputs a string of the correct length
      the compare command
        outputs true for valid comparison
        outputs false for invalid comparison
    
    Finished in 6.23 seconds
    10 examples, 0 failures


Meh.
----

(c) 2010 Paul Annesley, MIT license.
