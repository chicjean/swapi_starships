require 'spec_helper'
require 'starship_search'
require 'tatooine'

describe "StarshipSearch" do 
	let(:starship_1) {
		double(name: "Y-Wing", model: "BTL Y-wing",
			manufacturer: "Koensayr Manufacturing",
			starship_class: "assault starfighter")
	}

	let(:starship_2) {
		double(name: "X-Wing", model: "T-65 X-wing",
			manufacturer: "Incom Corporation",
			starship_class: "Starfighter")
	}

	let(:starship_3) {
		double(name: "Deathstar", model: "DS-1 Orbital Battle Station", 
			manufacturer: "Imperial Department of Military Research, Sienar Fleet Systems",
			starship_class: "Deep Space Mobile Battlestation")
	}

	let(:starships) {[starship_1, starship_2, starship_3]}

	it "filters startships based on name" do
		results = StarshipSearch.filter_by(:name, starships, "y wing")
		expect(results).to eq([starship_1, starship_2])
	end

	it "filters starships based on model" do
		results = StarshipSearch.filter_by(:model, starships, "DS-1 Orbital Battle Station")
		expect(results).to eq ([starship_3])
	end

	it "filters starships based on manufacturer" do
		results = StarshipSearch.filter_by(:manufacturer, starships, "Koensayr Manufacturing")
		expect(results).to eq([starship_1])
	end

	it "filters starships based on class" do
		results = StarshipSearch.filter_by(:starship_class, starships, "Starfighter")
		expect(results).to eq([starship_1, starship_2])
	end
end




