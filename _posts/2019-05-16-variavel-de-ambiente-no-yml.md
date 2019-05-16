---
layout: post
title: "Usando variável de ambiente em arquivo yml no Rails"
author: frankyston
categories: [ruby, rails, yaml, 'variável de ambiente']
image: assets/images/ruby-arrays.jpg
description: "Usando variável de ambiente em arquivo yml no Rails"
featured: false
hidden: false
---

Hoje precisei fazer uma integração no sistema que estou trabalhando e as configurações precisavam estar nas variáveis de ambiente.

Até ai tudo normal, sempre que faço integrações crio um arquivo `.yml` no diretório config do Rails, para colocar todas as informações necessárias.

```yaml
default: &defaults
  auth_user: <%= ENV['AUTH_USER_INTEGRATION'] %>
  auth_password: <%= ENV['AUTH_PASSWORD_INTEGRATION'] %>
  base_url: <%= ENV['BASE_URL_INTEGRATION'] %>

development:
  << *defaults

test:
  << *defaults

production:
  << *defaults
```

Nos projetos anteriores para eu ler esse arquivo eu sempre fazia assim:

```ruby
@configurations ||= YAML.load_file(Rails.root.join('config', 'arquivo.yml'))[Rails.env]
```

Desta forma eu conseguia acessar as informações de forma bem simples, basta acessar a chave correspondente, por exemple `@configurations['auth_user']`.

Mas dessa forma eu tive um problema, nos projetos anteriores eu não usava variáveis de ambiente, sempre eu colocar a string direto no `arquivo.yml` e a informação chegava sem problemas.

Mas com variáveis de ambiente, carregando o `yml` com `YAML.load_file` ao acessar a chave ele retornará a string literalmente `<%= ENV['AUTH_USER_INTEGRATION'] %>`.

Para resolver esse problema é bem simples, veja abaixo:

```ruby
@configurations ||= Rails.application.config_for(:arquivo)
```

Usando o `Rails.application.config_for` será de responsábilidade do Rails carregar o arquivo, processar o que está em `<%= %>` e assim retornar o valor corretamente.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
