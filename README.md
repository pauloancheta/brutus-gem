# The Brutus
My first gem: brute force!

## Create your hexdigest
```
require 'brutus'
brutus = Brutus.cipher('md5', 'hello')
#=> "5d41402abc4b2a76b9719d911017c592"
```

## Decipher an md5 hexdigest
```
require 'brutus'
brutus = Brutus.decipher('md5', "5d41402abc4b2a76b9719d911017c592" )
#=> "hello"
```
