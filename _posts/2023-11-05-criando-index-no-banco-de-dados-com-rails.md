---
layout: post
title: "Criando index no banco de dados com Rails"
author: frankyston
categories: [ruby, rails, console]
image: assets/images/index-rails.jpg
description: "Criando index no banco de dados com Rails"
featured: false
hidden: false
---

As vezes em sua vida de desenvolvedor você vai se deparar com problemas de performace no banco de dados, se você ainda não pegou esse problema, tenho uma notícia pra você, um dia ele vai chegar até você.

Ao buscar alguns dados especifico (filtrandos) de uma tabela a consulta demorava muitos segundos com a resposta.

Nesse momento pensei, será que é por conta do volume da tabela? Ou será que meu banco de dados é lento?

Essas são perguntas que deve ser investigadas e podem de fato ser a cauda da demora da consulta.

Mas o meu problema não era nenhuma dessa perguntas. O problema era Index.

Ai você deve está se perguntando, tá, mas como você garante que é index?

Analisando as perguntas que mostrei anteriormente, o servidor não estava lento, tinha muita memória sobrando (mais de 50%). O volume de dados das tabelas não chegava a 200 mil registros, por tanto deveria ser até ok a resposta.

Ao ver esse cenário, imaginei logo que seria index.

Tá, mas o que é Índices no banco de dados?

Índice é como em um livro, antes de você ler ele inteiro, você vai no índice e tem uma visão mais rápido do conteúdo dentro dele. Quando você pergunta uma determinada informação para uma tabela, primeiro ele vai no índice checar se tem essa informação, se tiver ele devolve a linha encontrada. Mas se a informação não está no índice, a busca vai percorrer a tabela inteira, encontrar o registro e devolver a linha pedida.

Índice são muito úteis quando você sabe que determinada informação será muito buscada no sistema.

Vamos a um exemplo, imagine que você tem uma tabela de produtos, nessa tabela temos os campos nome, quantidade de estoque, preço e muito outros campos.

Em um e-commerce, o campo nome será muito buscado, diferente do campo preço.

Então nesse caso, é interessante ter um índice no nome para buscar um determinado produto.

Como podemos usar índice no rails?

Primeira exemplo é quando não existe o campo e já queremos que ele tenha um índice:

Esse exemplo é da documentação oficial do rails (https://guides.rubyonrails.org/active_record_migrations.html#adding-new-columns)

Gerando a migration no terminal
```ruby
bin/rails generate migration AddPartNumberToProducts part_number:string:index
```

Observe que pedi para gerar o campo part_number, depois : para o tipo do campo como string, depois : para adicionar o index.

Migration gerada
```ruby
class AddPartNumberToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :part_number, :string
    add_index :products, :part_number # <--- observe que aqui aparece um add_index
  end
end
```

Mas se eu já tenho o campo na tabela e preciso só adicionar o índice, como é que faz?

Gerando a migration no terminal
```ruby
bin/rails generate migration add_index_to_users_email
```

Obersrve que nome da migration tem uma palavra mágica chamada add_index. Aqui é um truque para gerar migrations, usando o `add_index`, `to`, `table`, `field`. Se quiserem um post sobre esses truques de migrations comentem abaixo que posso criar um post só sobre isso.

Migration gerada
```ruby
class AddIndexToUsersEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email
  end
end
```

Na migration podemos até modificar o nome do index, pois o próprio rails cuida de gerar um nome pra você.
```ruby
class AddIndexToUsersEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, name: "index_users_on_email", unique: true
  end
end
```

Com essa simples migration podemos melhorar a busca dos dados em uma tabela lenta.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
