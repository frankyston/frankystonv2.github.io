---
layout: post
title: "Como usar att_accessor, attr_reader e attr_writer"
author: frankyston
categories: [ruby, rails, att writter, att accessor, att reader, OOP, POO, classes]
image: assets/images/atributos-ruby.png
description: "Como usar att_accessor, attr_reader e attr_writer"
featured: false
hidden: false
---

Quando estamos iniciando nos conceitos de programação orientado a objeto no ruby, descobrir 3 palavras máginas que as vezes podem ser confusas no inicio.

Elas são: `att_reader`, `attr_accessor` e `attr_writter`.

### [attr_reader](#attr_reader)

Para entender, vamos entender como o conceito da orientação a objeto sobre os métodos de acesso em classes.

Vejamos a classe abaixo:

```ruby
class Book
  def initialize(title, author)
    @title = title
    @author = author
  end
end

book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">
```

Neste código criamos uma classe chamada `Book` e nele usamos o método initialize para iniciar um novo objeto com o título e autor. Ao imprimir o objeto,
podemos perceber que ele imprimiu sua referência e os atributos title e author.

Você poder está pensando, tá até aqui tudo certo, não há problema nesse código. E você está correto, ele funciona, mas não conseguimos acessar o título
e nem o autor.

```ruby
book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">

book.title
#(irb):9:in `<main>': undefined method `title' for #<Book:0x000000010292cbd0 @title="Introdução a POO com ruby", @author="John Doe"> (NoMethodError)
```

O erro acontece por que um objeto Ruby tem seus métodos públicos por padrão, mas seus dados (atributos) são privados.

Legal, com essa informação, podemos melhorar nossa classe e permitir que o objeto acesse os dados.

```ruby
class Book
  def initialize(title, author)
    @title = title
    @author = author
  end

  def title
    @title
  end

  def author
    @author
  end
end

book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">

book.title
#=> "Introdução a POO com ruby"

book.author
#=> "John Doe"
```

No código acima, criamos dois métodos e o que esses métodos fazem é nada mais do que acessar o atributo (dado) que inicializamos ao criar um novo objeto
book.

Esses métodos na orientação a objetos é conhecido como `getters`.

Mas não para por ai, uma coisa legal do ruby é que existe uma forma mais legal de fazer `getters` e ele é o `attr_reader`.

Vamos ver o código abaixo:

```ruby
class Book
  attr_reader :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end
end

book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">

book.title
#=> "Introdução a POO com ruby"

book.author
#=> "John Doe"
```

O código acima, faz a mesma coisa que ter os métodos `title` e `author`. Só que de uma forma mais fácil. O que o ruby faz é gerar esses métodos para
você sozinho quando usamos o `attr_reader`.

A função do `attr_reader` se for traduzido é, atributo de leitura e ele faz exatamente isso, permite que o objeto leia o dado (atributo).

Agora que aprendemos o `attr_reader`, vamos entender o `attr_writer`.

### [attr_writer](#attr_writer)

Com ele podemos permitir somente guardar ou atribuir o dado no objeto. Isso significa que podemos adicionar um dado e somente isso.

Vamos de código para entender.

```ruby
class Book
  attr_reader :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end
end

book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">

book.title = 'Novo título'
#in `<main>': undefined method `title=' for #<Book:0x0000000102ced648 @title="Introdução a POO com ruby", @author="John Doe"> (NoMethodError)
```

No código acima, eu tentei modificar o título do livro e recemos um erro informando que não existe o método `title=`. Isso acontece por que não temos
esse método dispónivel no objeto. Então vamos resolver.

```ruby
class Book
  attr_reader :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end

  def title=(new_title)
    @title = new_title
  end

  def author=(new_author)
    @author = new_author
  end
end

book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">

book.title = 'Novo título'
#=> "Novo título"

book
#=> #<Book:0x000000010287fb10 @author="John Doe", @title="Novo título">
```

Agora que temos os métodos do atritubo + = podemos alterar seus valores e esses métodos é conhecido na orientação a objeto como `setters`.

Mas como aprendemos no `attr_reader` que ele é para facilizar a gerar os `getters`. O `attr_writer` é o alias (apelido) para criar os `setters` no ruby.

```ruby
class Book
  attr_accessor :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end
end

book = Book.new("Introdução a POO com ruby", "John Doe")
#<Book:0x000000010292cbd0 @author="John Doe", @title="Introdução a POO com ruby">

book.title = 'Novo título'
#=> "Novo título"

book
#=> #<Book:0x000000010287fb10 @author="John Doe", @title="Novo título">
```

Bem melhor né?

### [attr_acessor](#attr_acessor)

Por último vamos entender o `attr_acessor`.

Ele serve para os dois casos, permitir que o ruby gere os métodos de leitura `getters` e o `setters`. Simples assim.

Agora que aprendemos os 3, vou deixar uma tabela abaixo para visualizar rapidamente a diferença dos 3.

| alias             |      Função                                  |
|-------------------|:--------------------------------------------:|
| attr_reader       | Cria somente os métodos de leitura `getters` |
| attr_writer       | Cria somente os métodos de escrita `setters` |
| attr_accessor     | Cria os dois métodos                         |

<br>
Lembrando que por padrão o ruby já deixa configurado o `attr_reader`.

Em outro post explico como deixar eles privados.


Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
