require 'rails_helper'

describe "Viewing the list of starships" do 

	it "displays the name of each starship" do 
		starship1 = Tatooine::Starship.get(10)
		starship2 = Tatooine::Starship.get(20)
		starship3 = Tatooine::Starship.get(30)

		visit starships_path

		expect(page).to have_text(starship1.name)
		expect(page).to have_text(starship2.name)
		expect(page).to have_text(starship3.name)
	end

end