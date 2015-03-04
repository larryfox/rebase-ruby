# Rebase
Convert integers to a given base and back again. Accepts bases 2—62, or an array of an arbitrary alphabet.

[![Build Status](https://travis-ci.org/larryfox/rebase-ruby.svg?branch=master)](https://travis-ci.org/larryfox/rebase-ruby)
[![Code Climate](https://codeclimate.com/github/larryfox/rebase-ruby/badges/gpa.svg)](https://codeclimate.com/github/larryfox/rebase-ruby)

~~~ruby
require 'rebase'

Base62 = Rebase(62)
Base62.encode(10622433094) # => "Base62"
Base62.decode('Base62') # => 10622433094

# Extensions to String and Integer
require 'rebase/ext'

'Base62'.decode_base(62) # => 10622433094
10622433094.encode_base(62) # => "Base62"
~~~

## `Rebase(base[, int])`
Base can be an integer between 2 and 62, an array forming a custom alphabet (items are expected to respond to `#to_s`), or the symbol `:hex` or `:binary` for base 16 and base 2 respectively. Passing the optional int is the equivalent of calling `Rebase(base).encode(int)`.

## `encode(int)`
Returns string representation of `int` in a given base. `int` must be non negative, otherwise it raises an `ArgumentError`.

## `decode(str)`
Returns integer representation of `str` in base 10. `str` must not be blank or contain invalid characters, otherwise it raises an `ArgumentError`.

### License
The MIT License. Copyright © 2014 Larry Fox
