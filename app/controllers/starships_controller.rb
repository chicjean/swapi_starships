class StarshipsController < ApplicationController

	def index
		get_starships

		if params[:name_search]
		 	@starships = search_ships_by_name(params[:name_search])
		end

		# if params[:model_search]
		# 	@starships = search_ships_by_model(params[:model_search])
		# end
		
		# if params[:manufacturer_search]
		# 	@starships = search_ships_by_manufacturer(params[:manufacturer_search])
		# end

		if params[:class_search]
		 	@starships = search_ships_by_class(params[:class_search])
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
		# if search_params.include?(" ")
		# 	search_params.split(' ').each do |param|
		# 		@starships.select do |ship|
		# 			ship.name.downcase.include?(param.downcase)
		# 			debugger
		# 		end
		# 	end
		# else 
			@starships.select do |ship| 
				ship.name.downcase.include?(search_params.downcase)
			end
		# end
	end

	# def search_ships_by_model(search_params)
	# 	@starships.select do |ship| 
	# 		ship.model.downcase.include?(search_params.downcase) 
	# 	end
	# end

	# def search_ships_by_manufacturer(search_params)
	# 	@starships.select do |ship| 
	# 		ship.manufacturer.downcase.include?(search_params.downcase)
	# 	end
	# end

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