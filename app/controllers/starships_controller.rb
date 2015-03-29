class StarshipsController < ApplicationController

	def index
		get_starships

		if params[:name_search]
		 	@starships = search_ships_by_name(params[:name_search])
		end

		if params[:model_search]
			@starships = search_ships_by_model(params[:model_search])
		end
		
		if params[:manufacturer_search]
			@starships = search_ships_by_manufacturer(params[:manufacturer_search])
		end
	end

private 
	def get_starships
		starships = Tatooine::Starship.list
		until starships.length == Tatooine::Starship.count
			starships.concat Tatooine::Starship.next
		end
		@starships = starships
		@class_list = get_class_list
	end

	def search_ships_by_name(search_params)
		@starships.select do |ship| 
			search_params.split(' ').each do |param|
				ship.name.downcase.include?(param.downcase)
			end
		end
	end

	def search_ships_by_model(search_params)
		@starships.select do |ship| 
			ship.model.downcase.include?(search_params.downcase) 
		end
	end

	def search_ships_by_manufacturer(search_params)
		@starships.select do |ship| 
			ship.manufacturer.downcase.include?(search_params.downcase)
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