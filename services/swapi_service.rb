module SWAPI
    include HTTParty
    base_uri 'https://swapi.dev/'
    format :json
    headers Accept: '*/*',
            'Content-Type: application/json'
end