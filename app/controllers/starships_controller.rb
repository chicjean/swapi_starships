class StarshipsController < ApplicationController

	def index

		starships = Tatooine::Starship.list

		until starships.length == Tatooine::Starship.count
			starships.concat Tatooine::Starship.next
		end

		@starships = starships

		# @starships.id = @starships[].url.split('/').last

		#  if params[:search]
		#  	@starships = starships 
		#  	# @starships = search_ships(params[:search])
		# # 	@starships = starships.select(:all, :conditions => [ 'name LIKE ?', "%#{params[:search]}%"] )
		#  else 
		# 	@starships = starships 
		# end
		
	end

# private 

# 	def search_ships(search_params)
		
# 	end

end



#starships.select {|ship| ship.name.downcase.include?("imperial") }