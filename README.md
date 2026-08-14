# Automação de Testes de API - Star Wars (SWAPI)
[![API Tests](https://github.com/jaquelineleite/testes_automatizados_apis_star_wars/actions/workflows/api-tests.yml/badge.svg)](https://github.com/jaquelineleite/testes_automatizados_apis_star_wars/actions/workflows/api-tests.yml)

Projeto de automação de testes de API desenvolvido utilizando **Ruby**, **RSpec** e **HTTParty**, consumindo a API pública **SWAPI (Star Wars API)**.

O objetivo do projeto é demonstrar a criação e execução de testes automatizados para APIs REST, realizando validações de status code, conteúdo das respostas e regras dos dados retornados.

## Tecnologias utilizadas

- Ruby
- RSpec
- HTTParty
- Bundler
- API REST
- SWAPI

## Pré-requisitos

Para executar o projeto é necessário possuir:

- Ruby instalado
- Bundler instalado

Para instalar o Bundler:

```bash
gem install bundler

## Cenários automatizados

A suíte contempla os seguintes cenários de teste:

1. Validação do formato JSON retornado pela API de filmes.
2. Validação de resposta HTTP para requisições GET.
3. Validação de retorno para recurso inexistente.
4. Validação do comportamento ao consultar um filme inexistente.
5. Validação do título de um episódio.
6. Validação do `episode_id` e do tipo do dado retornado.
7. Validação do formato da data de lançamento.
8. Validação dos dados do personagem C-3PO, incluindo altura, peso e participação em filmes.

## Integração Contínua

O projeto utiliza **GitHub Actions** para executar automaticamente a suíte de testes RSpec.

O pipeline é executado em:

- Push para a branch `main`
- Pull Requests direcionados para a branch `main`

Execução dos testes:

```bash
bundle exec rspec
