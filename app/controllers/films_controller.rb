require 'rest-client'

class FilmsController < ApplicationController
    def show_all
        response = RestClient.get 'https://swapi.co/api/films'

        json = JSON.parse response

        @results = json["results"]


    end

    def show
    end
end
