require 'rest-client'

class FilmsController < ApplicationController
    def show_all
        response = RestClient.get 'https://swapi.co/api/films'

        json = JSON.parse response

        @results = json["results"]


    end

    def show
        id = params[:id]
        response = RestClient.get "https://swapi.co/api/films/#{id}"
        json = JSON.parse response
        

        @title = json['title']
        @episode_id = json['episode_id']
        @release_date = json['release_date']
        @director = json['director']
        @producer = json['producer']
        @opening = json['opening_crawl']

        @characters = Array.new

        json['characters'].each do |url|
            @characters << (JSON.parse (RestClient.get url))
        end

        @planets = Array.new
        json['planets'].each do |url|
            @planets << (JSON.parse (RestClient.get url))
        end

        @starships = Array.new
        json['starships'].each do |url|
            @starships << (JSON.parse (RestClient.get url))
        end

    end
end
