class StarshipsController < ApplicationController

	def index
		get starships

		@class_list = get_class_list

		if params[:name_search] && params[:name_search] != ""
		 	@starships = search_ships_by_name(params[:name_search])
		end
		if params[:model_search] && params[:model_search] != ""
			@starships = search_ships_by_model(params[:model_search])
		end
		
		if params[:manufacturer_search] && params[:manufacturer_search] != ""
			@starships = search_ships_by_manufacturer(params[:manufacturer_search])
		end

		if params[:class_search] && params[:class_search] != ""
		 	@starships = search_ships_by_class(params[:class_search])
		end

	end

private 
	def get_starships
		starships = Tatooine::Starship.list
		until starships.length == Tatooine::Starship.count
			starships.concat Tatooine::Starship.next
		end
		starships	
	end

	def search_ships_by_name(search_params)
		search_results = []
			search_params.split(' ').each do |param|
				@starships.each do |ship|
					if ship.name.downcase.include?(param.downcase)
						search_results << ship
					end
				end
			end
		search_results.uniq
	end

	def search_ships_by_model(search_params)
		search_results = []
			search_params.split(' ').each do |param|
				@starships.each do |ship|
					if ship.model.downcase.include?(param.downcase)
						search_results << ship
					end
				end
			end
		search_results.uniq
	end

	def search_ships_by_manufacturer(search_params)
		search_results = []
			search_params.split(' ').each do |param|
				@starships.each do |ship|
					if ship.manufacturer.downcase.include?(param.downcase)
						search_results << ship
					end
				end
			end
		search_results.uniq
	end

	def search_ships_by_class(search_params)
		@starships.select do |ship|
			ship.starship_class.downcase == search_params.downcase
		end
	end

	def get_class_list
		class_list = []
		@starships.each do |ship|
			class_list << ship.starship_class.capitalize
		end
		class_list.uniq.sort
	end
end