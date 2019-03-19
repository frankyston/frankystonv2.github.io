---
layout: post
title: "Hello World"
author: frankyston
categories: [tutorial]
image: assets/images/hello-world.png
description: "Primeiro post do Blog."
featured: false
hidden: false
---

Olá pessoal, esse é o meu primeiro post no novo site/domínio :)

Quero transformar esse blog/site em um repositório de dicas e tutoriais sobre a linguagem Ruby e o framework Rails.

Para não deixar esse post sem um pouco de código vamos ver como fazer um hello world em ruby.

#### Como ser faz?

Veremos duas formas de fazer o hello world.

1. Sem interpolação
2. Com interpolação

#### Sem interpolação

```ruby
puts 'Hello World'
```

Sem interpolação é importante notar que uma das conversões da linguagem é sempre usar aspas simples para todo e qualquer string.

#### Com interpolação

```ruby
world = 'World'
puts "hello #{world}"
```

Observe que para interpolação estamos usando asplas duplas, essa é uma conversão do Ruby pois temos que dizer ao interpretador que temos variáveis para processar, para isso usamos o `#{}` para dizer ao ruby que variável estamos usando, que no nosso caso é a variável `world`.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
