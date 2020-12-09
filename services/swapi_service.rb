module SWAPI
    include HTTParty
    base_uri 'https://swapi.dev/'
    format :json
end