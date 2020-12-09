describe '1. Validar o formato da request (json válido) para a seguinte API: https://swapi.dev/api/films/?format=json', :teste_1 do
    it 'get' do
        response = SWAPI.get('/api/films/?format=json')
                
        # VALIDANDO A RESPOSTA.
        # ------------------------------------------------------------------------------
        # Retorna o status code da resposta .code
        # Retorna todas as informacoes da resposta .inspect
        # Retorna o valor da requisição de atributo .request
        # Retorna o valor da resposta do atributo .response
        # Retorna o valor dos cabeçalhos de atributo .headers

        # Retorna o valor do atributo body .body
        # Exemplo: puts "\nresponse body: #{response.body}"

        # Retorna a classe .class
        # Converte para json pq vem como string .parsed_response
        # Retorna apenas os dados do nome .parsed_response['data']['attributes']['name']

        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        puts "\nresponse body: #{response.parsed_response}"

        # Status HTTP 200 (OK)
        # O código de status HTTP Status 200 (OK) indica que o request foi processado com sucesso no servidor.
        # O response payload depende do método HTTP que foi selecionado para o request.
        expect(response.code).to eq 200
        expect(response.message).to eq "OK"
    end
end

describe '2. Validar se o retorno HTTP é válido para um GET', :teste_2 do
    it 'get' do
        response = SWAPI.get('/api/films/?format=json')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers['allow']}"
        
        expect(response.headers['allow']).to eq "GET, HEAD, OPTIONS"
    end
end

describe '3. Validar retornos para URLs inválidas, como por exemplo: https://swapi.dev/api/people/?format=jsonx', :teste_3 do
    it 'get' do
        response = SWAPI.get('/api/people/?format=jsonx')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        
        expect(response.code).to eq 200
        expect(response.message).to eq "OK"
    end
end

describe '4. Validar se o filme 10 é válido e qual o tipo de retorno ao consultar;', :teste_4 do
    it 'get' do
        response = SWAPI.get('/api/films/10')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        
        expect(response.code).to eq 200
        expect(response.message).to eq "OK"
    end
end

describe '5. Validar o nome correto de um determinado episódio de filme;', :teste_5 do
    it 'get' do
        response = SWAPI.get('/api/films/1')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        puts "\nresponse body: #{response.parsed_response}"
        
        expect(response.parsed_response['title']).to eq 'A New Hope'
    end
end

describe '6. Validar o ID do episódio e o tipo do dado está correto', :teste_6 do
    it 'get' do
        response = SWAPI.get('/api/films/1')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        puts "\nresponse body: #{response.parsed_response}"
        
        expect(response.parsed_response['episode_id']).to eq 4
    end
end

describe '7. Validar o formato de data válida (padrão americano) e validar se a data não é padrão Brasil', :teste_7 do
    it 'get' do
        response = SWAPI.get('/api/films/1')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        puts "\nresponse body: #{response.parsed_response}"
        
        expect(response.parsed_response['release_date']).to eq "1977-05-25" #Formato Americano
        expect(response.parsed_response['release_date']).not_to eq "25/05/1977" #Formato Brasil
    end
end

describe '8. Validar o peso e altura do “people” C-3PO e validar pelo menos um filme que ele tenha participado', :teste_8 do
    it 'get' do
        response = SWAPI.get('/api/people/?search=C-3PO')
                
        puts "\nresponse code: #{response.code}"
        puts "\nresponse message: #{response.message}"
        puts "\nresponse headers: #{response.headers}"
        puts "\nresponse body: #{response.parsed_response['results']}"

        dados = response.parsed_response['results']

        dados.each do |item|
            
            puts "\nAltura: #{item["name"]}"
            puts "\nPeso: #{item["mass"]}"
            puts "\nFilmes: #{item["films"]}"
            # etc

            expect(item["mass"]).to eq "75" #Valida se o valor do peso é 75
            expect(item["films"]).to include "http://swapi.dev/api/films/1/" #Filme que pelo menos tem participado
            expect(item["films"][0]).to eq "http://swapi.dev/api/films/1/"

        end
    end
end
