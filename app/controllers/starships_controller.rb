class StarshipsController < ApplicationController

	def index
		@starships = get_starships
		@class_list = get_class_list

		if params[:name_search] && params[:name_search] != ""
		 	@starships = StarshipSearch.filter_by(:name, @starships, params[:name_search])
		end

		if params[:model_search] && params[:model_search] != ""
			@starships = StarshipSearch.filter_by(:name, @starships, params[:model_search])
		end
		
		if params[:manufacturer_search] && params[:manufacturer_search] != ""
			@starships = StarshipSearch.filter_by(:name, @starships, params[:manufacturer_search])
		end

		if params[:class_search] && params[:class_search] != ""
		 	@starships = StarshipSearch.filter_by(:name, @starships, params[:class_search])
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

	def get_class_list
		class_list = []
		@starships.each do |ship|
			class_list << ship.starship_class.capitalize
		end
		class_list.uniq.sort
	end
end