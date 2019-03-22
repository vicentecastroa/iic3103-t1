require 'rest-client'

class PlanetsController < ApplicationController

  def show
    id = params[:id]
    response = RestClient.get "https://swapi.co/api/planets/#{id}"
    json = JSON.parse response

    @name = json['name']
    @rotation_period = json['rotation_period']
    @orbital_period = json['orbital_period']
    @diameter = json['diameter']
    @climate = json['climate']
    @gravity = json['gravity']
    @terrain = json['terrain']
    @surface_water = json['surface_water']
    @population = json['population']

    @characters = Array.new
    json['residents'].each do |url|
        @characters << (JSON.parse (RestClient.get url))
    end

    @films = Array.new
    json['films'].each do |url|
        @films << (JSON.parse (RestClient.get url))
    end

  end
end
