module StarshipSearch
	def self.filter_by(attribute, collection, search_params)
		search_results = []
			search_params.split(' ').each do |param|
				collection.each do |ship|
					if ship.send(attribute).downcase.include?(param.downcase)
						search_results << ship
					end
				end
			end
		search_results.uniq
	end

end