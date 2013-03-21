class Movie < ActiveRecord::Base

#Mar 14 hw2 part 2
	def self.all_ratings
		Array ['G','PG','PG-13','R']
	end
end