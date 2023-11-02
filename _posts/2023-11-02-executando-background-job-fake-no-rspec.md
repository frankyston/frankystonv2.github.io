---
layout: post
title: "Executando background job fake no Rspec"
author: frankyston
categories: [ruby, rails, console]
image: assets/images/job-fake.png
description: "Executando background job fake no Rspec"
featured: false
hidden: false
---

Alguns dias atrás precisei fazer um teste de E2E (End-To-End) que ao receber o request passa para o background job a requisição.

Para entender o por que dessa decisão o request é para gerar um grande relatório e devolver essa resposta só depois de gerar o relatório não é uma ideia legal.

Para que possam imaginar o cenário, vamos imaginar o seguinte controller:

```ruby
class ReportController < ApllicationController
  def create
    GenereteReportWorker.perform_asyn(params[:company_id], params[:q])

    render json: { message: 'Relatório será enviado ao seu e-mail em alguns instantes.' }, status: :ok
  end
end
```

No teste Rspec seria algo próximo do exemplo abaixo:

```ruby
require 'rails_helper'

RSpec.describe ReportController, type: :request do
  let!(:company) { create(:company) }
  describe '#create' do
    it 'Should return status 200' do
      get '/api/v1/report', params: { company_id: company.id }

      expect(response).to be_ok
    end
  end
end
```

Até aqui tudo ok, certo? Errado, ao executar esse teste, se o seu ambiente de teste não estiver configurado para executar background job, o teste vai falhar e ainda tem outro problema, com o ambiente configurado corretamento no de teste, esse job irá executar toda vez que o teste for executado.

Agora o truque legal desse post, o Sidekiq tem um fake para o simular que o job entrou na fila na hora do teste.

Veja como colocar no seu teste:

```ruby
require 'rails_helper'
require 'sidekiq/testing' # <----- Adicione esse require
Sidekiq::Testing.fake! # <----- Execute essa linha antes de todos os testes desse arquivo.

RSpec.describe ReportController, type: :request do
  let!(:company) { create(:company) }
  describe '#create' do
    it 'Should return status 200' do
      get '/api/v1/report', params: { company_id: company.id }

      expect(response).to be_ok
    end
  end
end
```

Dessa forma executando jobs fake nos nossos testes.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
