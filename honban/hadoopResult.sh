 #!/bin/sh
(cat moz_places.csv | ~/.rubies/ruby-1.9.3-p448/bin/ruby mapper.rb | ~/.rubies/ruby-1.9.3-p448/bin/ruby reducer.rb) >> result.txt
