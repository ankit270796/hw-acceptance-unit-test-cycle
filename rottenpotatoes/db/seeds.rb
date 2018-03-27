# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Aladdin', :director => 'Ron Clements', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :director => 'James Cameron', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :director => 'Rob Reiner', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :director => 'Tate Taylor', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :director => 'Lasse Hallström', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :director => 'Jean-Pierre Jeunet', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey',  :director => 'Stanley Kubrick', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles',  :director => 'Brad Bird', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark',  :director => 'Steven Spielberg', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run',  :director => 'Nick Park', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end