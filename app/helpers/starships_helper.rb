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

	def price_known?(ship)
		if ship.cost_in_credits == "unknown"
			"This ship is not currently available for sale."
		else
			"#{number_with_delimiter(ship.cost_in_credits)} Galaxtic Credit Standard"
		end
	end

end
