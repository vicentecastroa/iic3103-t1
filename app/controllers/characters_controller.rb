require 'rest-client'

class CharactersController < ApplicationController
  def show
    id = params[:id]
    response = RestClient.get "https://swapi.co/api/people/#{id}"
    json = JSON.parse response

    @name = json['name']
    @height = json['height']
    @mass = json['mass']
    @hair_color = json['hair_color']
    @eye_color = json['eye_color']
    @skin_color = json['skin_color']
    @birth_year = json['birth_year']
    @gender = json ['gender']
    @homeworld = (JSON.parse (RestClient.get (json['homeworld'])))['name']

    @films = Array.new
    json['films'].each do |url|
        @films << (JSON.parse (RestClient.get url))
    end
    
    @starships = Array.new
    json['starships'].each do |url|
        @starships << (JSON.parse (RestClient.get url))
    end
  end
end
