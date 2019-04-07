---
layout: post
title: "Tripla igualdade no Ruby"
author: frankyston
categories: [tutorial, ruby]
image: assets/images/ruby-language.png
description: "Você já se perguntou como funciona o `===` no ruby?"
featured: false
hidden: false
---

Você já se perguntou como funciona o `===` no ruby?

Neste post vamos te mostrar como ele funciona.

#### O que é `===`?

Antes de mais nada, saiba que tripla igualdade não é um operador de igualdade, ele não tem absolutamente nada de igualdade.

#### Fale mais...

Vejamos um exemplo `a === b`, quando você olha para esse código logo pensa que estamos perguntando `a` é igual a `b`? Isso seria correto se fosse `==`, mas nesse caso estamos fazendo a seguinte pergunta "Se eu tenho uma gavata rotula de a, faz sentido colocar b nela?"

Isso significa que o `===` ele verifica tanto se o operador da esquerda (`a`) é do mesmo tipo do operador da direita (`b`).

##### Exemplos de uso da tripla igualdade

```ruby
String === "a"
true # "a" é uma String?
"a".is_a?(String)
true # forma diferente de "a" é uma String?
```

Observe que estamos verificando de duas formas diferente se a variável `a` é do tipo `String`.

Agora veremos alguns casos interessantes:

```ruby
1 === "1" #=> false
1 === 1 #=> true
1 === 2 #=> false
```

Como podemos ver, o `===` ele tanto verifica se o tipo é igual como também se o valor é igual, por isso as vezes é confundido com um operador de igualdade.

Lembre-se, o `===` existe mais para verificar o seu tipo, a maioria das classes já tem implementado um método que substitui o `===`, por isso evite usar o `===`.

Vejamos alguns exemplos:

No exemplo abaixo estamos chegando se o objeto `obj` é do tipo da classe `ActiveRecord::Base`:

```ruby
obj = 'a'
ActiveRecord::Base.===(obj) #=> false
```

Agora se instanciar uma classe que pertence ao ActiveRecord, veja o que acontece:

```ruby
obj = User.new
ActiveRecord::Base.===(obj) #=> true
```

Observe que estamos usando o `===`, mas o correto é usar o `is_a?`

```ruby
obj = User.new
obj.is_a?(ActiveRecord::Base) #=> true
```

##### Mais exemplos

```ruby
(1..10) === 1 #=> true
```

O código acima pode ser usado assim:

```ruby
(1..10).include?(1) #=> true
```

Para ranges, o `===` é um alias para `inclide?`, assim como para classes o `===` é um alias para `is_a?

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
