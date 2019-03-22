require 'rest-client'

class SearchController < ApplicationController
  
  def search
    keyword = params[:keyword]
    @keyword = keyword
    films = JSON.parse(RestClient.get "https://swapi.co/api/films/?search=#{keyword}")
    people = JSON.parse(RestClient.get "https://swapi.co/api/people/?search=#{keyword}")
    starships = JSON.parse(RestClient.get "https://swapi.co/api/starships/?search=#{keyword}")
    planets = JSON.parse(RestClient.get "https://swapi.co/api/planets/?search=#{keyword}")
    @characters = Array.new
    people['results'].each do |character|
        @characters << character
    end

    @films = Array.new
    films['results'].each do |film|
        @films << film
    end

    @planets = Array.new
    planets['results'].each do |planet|
        @planets << planet
    end

    @starships = Array.new
    starships['results'].each do |starship|
        @starships << starship
    end

    render 'search_results'
  end

end
