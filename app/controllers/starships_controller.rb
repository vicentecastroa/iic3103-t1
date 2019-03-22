require 'rest-client'

class StarshipsController < ApplicationController

  def show
    id = params[:id]
    response = RestClient.get "https://swapi.co/api/starships/#{id}"
    json = JSON.parse response

    @name = json['name']
    @model = json['model']
    @manufacturer = json['manufacturer']
    @cost_in_credits = json['cost_in_credits']
    @length = json['length']
    @max_atmosphering_speed = json['max_atmosphering_speed']
    @crew = json['crew']
    @passengers = json['passengers']
    @cargo_capacity = json['cargo_capacity']
    @consumables = json['consumables']
    @hyperdrive_rating = json['hyperdrive_rating']
    @MGLT = json['MGLT']
    @starship_class = json['starship_class']

    @pilots = Array.new
    json['pilots'].each do |url|
        @pilots << (JSON.parse (RestClient.get url))
    end

    @films = Array.new
    json['films'].each do |url|
        @films << (JSON.parse (RestClient.get url))
    end
  end

end
