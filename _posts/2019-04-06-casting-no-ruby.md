---
layout: post
title: "Casting no Ruby"
author: frankyston
categories: [tutorial, ruby, casting]
image: assets/images/ruby-language.png
description: "Casting, o que ele é? Como usamos? Quais são os seus tipos? Talvez quando você começou a estudar ruby já tenha feita alguma dessas perguntas."
featured: false
hidden: false
---

Casting, o que ele é? Como usamos? Quais são os seus tipos? Talvez quando você começou a estudar ruby você já fez alguma dessas perguntas.

Neste post vamos te mostrar como funciona o casting no Ruby.

#### O que é Casting?

Casting nada mais é do que você transformar um determinado valor de um tipo de dados para outro.

Por exemplo, você pode transformar um número que está no formado texto (string) para o formato correto que desejar.

#### Como usamos?

Vamos ver agora alguns exemplos de casting.

##### Casting com números reais

Abaixo vamos transformar uma texto númerico `"10.50"` para um número real.

```ruby
 "10.50".to_f #=> 10.5 
 Float("10.50") #=> 10.50
```

Agora se usarmos um texto para transformar em um número real, veja o que acontece:

```ruby
"qualquer texto".to_f #=> 0.0
Float("qualquer texto") # ArgumentError: invalid value for Float(): "qualquer texto"
```

##### Casting com String

Também podemos fazer o inverso, transformar um número real para um texto (string).

```ruby
10.5.to_s #=> "10.5"
String(10.5) #=> "10.5"
```

Normalmente usamos `to_s` para fazer o casting do que usar a class `String`. Também podemos fazer casting para string usando o método `Kernel#sprintf` e `String#%`:

```ruby
sprintf("%s", 10.5) #=> "10.5" 
"%s" % 10.5 #=> "10.5"
"%d" % 10.5 #=> "10"
"%.2f" % 10.5 #=> "10.50"
```

Veja qua a sintaxe é bastante parecido com a linguagem C.

##### Casting para Inteiro

Assim como conseguimos converter texto (string) para números reais, podemos fazer para números inteiros.

```ruby
 "12.40".to_i #=> 12
 Integer("12.40") #=> 12
```

Fique atento que no ruby só consegue fazer o casting de texto (string) para inteiro somente se o número estiver no inicio do texto, se ele estiver em qualquer outra posição do texto ele não fará o casting.

```ruby
 "12-foo".to_i # => 123 
 "bar-12".to_i # => 0
```

Agora se usarmos um texto para transformar em um número inteiro, veja o que acontece:

```ruby
"qualquer texto".to_i #=> 0.0
Integer("qualquer texto") # ArgumentError: invalid value for Integer(): "qualquer texto"
```

##### Curiosidade de Inteiro e Real no Ruby

```ruby
1/2 #=> 0
```
Como estamos dividindo dois inteiros, o resultado é um inteiro. Para resolver este problema, precisamos fazer o casting pelo menos um dos
números para real:

```ruby
1.0 / 2 #=> 0.5 
1.to_f / 2 #=> 0.5 
1 / Float(2) #=> 0.5
1.fdiv 2 # => 0.5
```

No último exemplo usamos o `fdiv` para poder ter a divisão exata sem precisar fazer o casting de um dos números para realizar a divisão exata.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
