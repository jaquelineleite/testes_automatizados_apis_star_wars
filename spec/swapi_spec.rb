describe '1. Validar o formato da request (json válido) para a seguinte API: https://swapi.dev/api/films/?format=json', :teste_1 do
  it 'get' do
    response = SWAPI.get('/api/films/?format=json')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response}"

    expect(response.code).to eq 200
    expect(response.message).to eq 'OK'

    # Valida se o retorno é JSON
    expect(response.headers['content-type'].to_s).to include('application/json')
    expect(response.parsed_response).to be_a(Hash)
    expect(response.parsed_response['results']).to be_a(Array)
  end
end


describe '2. Validar se o retorno HTTP é válido para um GET', :teste_2 do
  it 'get' do
    response = SWAPI.get('/api/films/?format=json')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"

    expect(response.code).to eq 200
    expect(response.message).to eq 'OK'
    expect(response.headers['content-type'].to_s).to include('application/json')
  end
end


describe '3. Validar retornos para URLs inválidas', :teste_3 do
  it 'get' do
    response = SWAPI.get('/api/people/999999/')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response}"

    expect(response.code).to eq 404
    expect(response.message).to eq 'Not Found'
    expect(response.headers['content-type'].to_s).to include('application/json')
  end
end


describe '4. Validar se o filme 10 é válido e qual o tipo de retorno ao consultar', :teste_4 do
  it 'get' do
    response = SWAPI.get('/api/films/10/')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response}"

    expect(response.code).to eq 404
    expect(response.message).to eq 'Not Found'
    expect(response.headers['content-type'].to_s).to include('application/json')
    expect(response.parsed_response).to be_a(Hash)
  end
end


describe '5. Validar o nome correto de um determinado episódio de filme', :teste_5 do
  it 'get' do
    response = SWAPI.get('/api/films/1/')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response}"

    expect(response.code).to eq 200
    expect(response.parsed_response['title']).to eq 'A New Hope'
  end
end


describe '6. Validar o ID do episódio e se o tipo do dado está correto', :teste_6 do
  it 'get' do
    response = SWAPI.get('/api/films/1/')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response}"

    episode_id = response.parsed_response['episode_id']

    expect(response.code).to eq 200
    expect(episode_id).to eq 4
    expect(episode_id).to be_a(Integer)
  end
end


describe '7. Validar o formato de data e garantir que não está no padrão Brasil', :teste_7 do
  it 'get' do
    response = SWAPI.get('/api/films/1/')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response}"

    release_date = response.parsed_response['release_date']

    expect(response.code).to eq 200
    expect(release_date).to eq '1977-05-25'
    expect(release_date).to match(/^\d{4}-\d{2}-\d{2}$/)
    expect(release_date).not_to eq '25/05/1977'
  end
end


describe '8. Validar o peso e altura do people C-3PO e validar pelo menos um filme que ele tenha participado', :teste_8 do
  it 'get' do
    response = SWAPI.get('/api/people/?search=C-3PO')

    puts "\nresponse code: #{response.code}"
    puts "\nresponse message: #{response.message}"
    puts "\nresponse headers: #{response.headers}"
    puts "\nresponse body: #{response.parsed_response['results']}"

    dados = response.parsed_response['results']

    expect(response.code).to eq 200
    expect(dados).not_to be_empty

    c3po = dados.first

    puts "\nNome: #{c3po['name']}"
    puts "\nAltura: #{c3po['height']}"
    puts "\nPeso: #{c3po['mass']}"
    puts "\nFilmes: #{c3po['films']}"

    expect(c3po['name']).to eq 'C-3PO'
    expect(c3po['height']).to eq '167'
    expect(c3po['mass']).to eq '75'
    expect(c3po['films']).not_to be_empty
    expect(c3po['films']).to include('https://swapi.dev/api/films/1/')
  end
end