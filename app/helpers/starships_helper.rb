module StarshipsHelper

	def zero_starships?
		@starships.length == 0
	end

	def max_atmosphering?(ship)
		if ship.max_atmosphering_speed == 'n/a'
			"This ship is not designed for atmospheric flight."
		else 
			"#{ship.max_atmosphering_speed} meters"
		end
	end

	def price_known?(ship)
		if ship.cost_in_credits == "unknown"
			"Call for price."
		else
			"#{number_with_delimiter(ship.cost_in_credits)} Galaxtic Credit Standard"
		end
	end

end
