# Base62
Encode and decode base 62.

~~~ruby
require 'base62'

Base62.encode62(10622433094) # => "Base62"
Base62.decode62('Base62') # => 10622433094

# Extensions to String and Fixnum
require 'base62/ext'

'Base62'.to_i_62 # => 10622433094
10622433094.to_s_62 # => "Base62"
~~~

## `encode62(int)` → str
Returns string representation of `int` in base 62. `int` must be non negative, otherwise it raises an `ArgumentError`.

## `decode62(str)` → int
Returns integer representation of `str`. `str` must not be blank or contain invalid characters, otherwise it raises an `ArgumentError`.

### License
The MIT License. Copyright © 2014 Larry Fox
