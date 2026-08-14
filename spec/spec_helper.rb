require 'httparty'
require_relative '../services/swapi_service'

RSpec.configure do |config|
  # Exibe os resultados dos testes de forma descritiva
  config.color = true
  config.formatter = :documentation

  # Configuração das expectations do RSpec
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Valida se métodos utilizados em mocks realmente existem
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
