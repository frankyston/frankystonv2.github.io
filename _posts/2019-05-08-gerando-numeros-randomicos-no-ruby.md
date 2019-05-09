---
layout: post
title: "Gerando número ou string randômicos no Ruby"
author: frankyston
categories: [dicas, ruby, random]
image: assets/images/ruby-arrays.jpg
description: "Gerando número ou string randômicos no Ruby"
featured: false
hidden: false
---

Hoje quero mostrar para vocês como gerar números ou strings randômicos.

Você deve está se perguntando para que serviria gerar números ou string aleatórios, a resposta é simples, você pode gerar campos de verificação únicas, gerar senha temporárias, pode gerar número do pedido aleatório de uma e-commerce, enfim, existe vários cenários que pode ser útil.

Então vamos para alguns casos:

Para todos os exemplos usaremos a classe `SecureRandom` que é o mais conhecido no ruby.

#### Gerando Alfanúmerico

```ruby
require 'securerandom'
SecureRandom.alphanumeric
# "210da0aa75ceb12f78b8deeddc1e1237"
```

#### Gerando Números

```ruby
require 'securerandom'
(SecureRandom.random_number * (10**10)).round
# 7648387571
```

Vamos entender o que acontece nesse gerador.

Se você usar somente `SecureRandom.random_number` ele vai gerar um número menor que zero `0.1701392562528966`.

Para que ele seja um número maior que zero multiplicamos ele por 10.

```ruby
require 'securerandom'
SecureRandom.random_number * 10
# 9.168478395872143
```

Agora se precisamos de 10 digitos elevamos o 10 que estamos multiplicando por 10 `(10**10)`.

```ruby
require 'securerandom'
SecureRandom.random_number * (10**10)
# 8195820392.420748
```

Mas isso ainda gera um número real, para pegar somente o número inteiro, usamos o método `round`. Assim pegamos somente os inteiros.

```ruby
require 'securerandom'
(SecureRandom.random_number * (10**10)).round
# 3400314897
```

Observe se você quiser gerar um número com quantidade maior, basta trocar a potência pela quantidade desejada.

#### Outra formas de gerar strings (bônus)

```ruby
require 'securerandom'
(0...50).map { ('a'..'z').to_a[rand(26)] }.join
# "egloqzktluwibsfknyrctvkrvyyvmfzkfywblyleqothpgteaz"
```

Neste caso estamos gerando somente letras minusculas, para gerar maiusculas basta trocar o `a` e o `z` para strings maiusculas `('A'..'Z')` e quantidade da string trocando o número do `(0..10)`.

O `rand(26)` é para a quantidade de caracteres no intervalo do alfabeto `a até z` como é feito o array `('a'..'z')`.


Para saber mais como funciona o SecureRandom acesse a documentação oficial [https://ruby-doc.org/stdlib-2.4.2/libdoc/securerandom/rdoc/SecureRandom.html](https://ruby-doc.org/stdlib-2.4.2/libdoc/securerandom/rdoc/SecureRandom.html)

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
