---
layout: post
title: "Como criar Arrays no Ruby"
author: frankyston
categories: [tutorial, ruby, dica]
image: assets/images/dry-rails.jpg
description: "Como criar Arrays no Ruby."
featured: false
hidden: false
---

Uma matriz é uma estrutura de dados que representa uma lista de valores, denominados elementos.

Arrays permitem armazenar vários valores em uma única variável. Isso pode condensar e organizar seu código, tornando-o mais legível e sustentável. E como os arrays são objetos com seus próprios métodos, eles podem tornar o trabalho com listas de dados muito mais fácil.

No Ruby você pode ter vários tipos de dados em um Array, como números, strings e objetos.

#### Algumas maneiras de criar arrays

##### Usando []

```ruby
cities = [
  "São Paulo",
  "Rio de Janeiro",
  "Fortaleza",
  "Curitiba"
]
```

Observe que você tem uma variável que contém todos as cidades. Neste exemplo, usamos colchetes - [] - para criar um array e separamos cada entrada com uma vírgula.

##### Usando `%w{}`

Se você quiser criar um array onde cada entrada é uma única palavra, você pode usar a sintaxe `%w{}`, que cria um array de palavras:

```ruby
days = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}
```

A forma anterior é equivalente ao código abaixo:

```ruby
days =  ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
```

Observe que o método `%w{}` permite ignorar as aspas e as vírgulas.

Os arrays costumam ser usados para agrupar listas de tipos de dados semelhantes, mas, em Ruby, os arrays podem conter qualquer valor ou uma combinação de valores, incluindo outros arrays. Aqui está um exemplo de uma matriz que contém uma string, um valor nulo, um inteiro e uma matriz de strings:

```ruby
record = [
    "João",
    null,
    7,
    [
        "Jogos",
        "Praia",
    ]
]
```

##### Acessando dados do Array

Antes de mais nada, saiba que arrays em ruby é base zero, isso significa que o primeiro elemento tem o indíce 0, o segundo elemento tem indíce 1 e assim por diante. Veja um exemplo:

```ruby
fruits = ["apple", "banana", "orange"]
```

Para mostrar a primeira fruta podemos fazer de algumas formas:

```ruby
puts fruits[0]
# apple
```

Podemos usar alguns métodos que o Ruby nos dá automaticamente:

```ruby
puts fruits.first
# apple

puts fruits.last
# orange
```

Assim como o `first` pega o primeiro elemento e o `last` pega o último, você pode colocar `-1` para pegar o último elemento.

```ruby
puts fruits[-1]
# orange
```

Se quizer descobrir qual é o indice de algum elemento você pode usar o método `index`.

```ruby
puts fruits.index('banana')
# 1
```

### Adicionado elementos no Array

Vamos usar o mesmo exemplo das frutas

```ruby
fruits = ["apple", "banana", "orange"]
```

Para adicionar uma nova fruta basta indicar o seu indíce e atribuir o seu valor.

```ruby
fruits[3] = "melon"
```

Outra alternativa para adicionar um novo elemento é usar o `<<`.

```ruby
fruits << 'pear'
```

Podemos usar o `unshift` para adicionar um novo elemento no inicio do nosso array.

```ruby
fruits.unshift('strawberry')
# fruits = ["strawberry", "apple", "banana", "orange", "melon", "pear"]
```

##### Removendo elementos do Array

Para remover um elemento específico de um array, use os métodos `delete` ou `delete_at`, `pop` e `shift`.

O `delete_at` você precisa informar o indíce do elemente que deseja remover.

```ruby
fruits.delete_at(4)
# melon
```

O `delete` você precisa informar o valor do elemento para remover do array.

```ruby
sharks.delete("banana")
# banana
```

O `pop` você remover o último elemento do Array.

```ruby
sharks.pop
# pear
```

O `shift` você remover o primeiro elemento do Array.

```ruby
sharks.shift
# apple
```

##### Interando em um Array

Para interar dinamicamente em um array podemos usar o `for .. in` e `each`.

Em breve irei fazer um post explicando cara um deles detalhadamente.

```ruby
sharks = ["Hammerhead", "Great White", "Tiger", "Whale"]
for shark in sharks do
  puts shark
end

sharks.each do |shark|
  puts shark
end
```

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
