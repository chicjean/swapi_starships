module StarshipsHelper

	def zero_starships?
		@starships.length == 0
	end

	def max_atmosphering?(ship)
		if ship.max_atmosphering_speed == 'n/a'
			"This ship is not designed for atmospheric travel."
		else 
			"#{ship.max_atmosphering_speed} Meters"
		end
	end

end
