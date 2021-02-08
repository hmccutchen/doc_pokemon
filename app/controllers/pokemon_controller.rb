class PokemonController < ApplicationController
	include HTTParty

  def index
   
    @page = params.fetch(:page, 0).to_i
  	response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/?limit=1&offset=#{@page}/")

     @res = JSON.parse(response.body)
     

      pokemon_data = HTTParty.get("#{@res["results"][0]["url"]}")
      @poke_data =JSON.parse(pokemon_data.body)
  end

end
