# The Brutus
My first gem: brute force!

## Create your hexdigest
```
require 'brutus'
brutus = Brutus.cipher('md5', 'hello')
#=> "5d41402abc4b2a76b9719d911017c592"
```

## Decipher an md5 hexdigest
```ruby
require 'brutus'

Brutus.decipher_letters('md5', "5d41402abc4b2a76b9719d911017c592" )
#=> "hello"

Brutus.decipher_numbers('md5', "81dc9bdb52d04dc20036dbd8313ed055" )
#=> "1234"
```
