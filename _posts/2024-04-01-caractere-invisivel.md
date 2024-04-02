---
layout: post
title: "Como remover caractere invisível no rails"
author: frankyston
categories: [ruby, rails, invisible space, gsub, string, caracter]
image: assets/images/caracter-invisible.jpg
description: "Neste post mostro um dos problemas do strip que é remover caractere invisível"
featured: false
hidden: false
---

Alguns dias atrás precisei fazer uma serie de testes de uma api que estava desenvolvendo. Até ai tudo certo, fiz a implementação, coloquei os testes,
e criei o Pull Request.

Pedi para a equipe testar.

Passou um tempo um colega chegou pra mim e falou, Frankyston, tem um caso que você não resolveu.

No primeiro momento eu fiquei surpreso, foi quando ele me apresentou esse site (https://www.editpad.org/tool/br/caractere-invisivel).

Pediu para eu colocar o caractere que tem no site e fazer um teste no endpoint.

Foi ai que tive uma surpresa. Veja com os próprios olhos o que aconteceu:

```ruby
irb(main):001> "Olá aqui é um teste com strip            ".strip
=> "Olá aqui é um teste com strip"
irb(main):002> "Olá aqui é um teste com caracter invisível    ‎         ".strip
=> "Olá aqui é um teste com caracter invisível    ‎"
irb(main):003>
```

Como podem observar, o caractere `‎` ainda continua mesmo usando o strip.

Para não ficar estranho, como se trata de um caracter invisível, tive que tirar um print do código para vocês verem o caractere em ação:

![Exemplo do Caractere invisível em ação](/assets/images/caracter-invisible-1.jpg)

O nosso amigo invisível é `[U+200E]`.

Isso me deixou intrigado, pesquisando na internet não vi nada que pudesse resolver de forma nativa pelo ruby.

Será que é de próposito não tratar esse caractere no strip?

Isso seria de fato uma decisão do sistema permitir ou não esse caractere especial?

Para quem não sabe, strip pode remover tanto espaços como tabulação e enter. Mas nunca tinha visto um cenário que ele não funciona-se.

Ai você pergunta, tá mas tem solução?

Sim temos uma forma de resolver e essa solução é o nosso velho amigo regex.

Então tive que aderir ao velho e amigo regex.

```ruby
irb(main):005> "Olá aqui é um teste com caracter invisível    ‎        ".gsub(/‎/, '').strip
=> "Olá aqui é um teste com caracter invisível"
```

Então a solução foi primeiro remover esse caractere da string e depois usar o strip.

E ai o que acharam dessa solução? Você conhece uma forma mais interessante de resolver? Comenta ai que posso atualizar esse post com forma mais legais.

Até o próximo post.
