class StarshipsController < ApplicationController

	def index

		starships = Tatooine::Starship.list

		until starships.length == Tatooine::Starship.count
			starships.concat Tatooine::Starship.next
		end

		@starships = starships
		
	end

end
