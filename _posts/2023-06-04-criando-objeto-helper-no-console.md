---
layout: post
title: "Criando objeto helper no console"
author: frankyston
categories: [ruby, rails, console]
image: assets/images/ruby-arrays.jpg
description: "Criando objeto helper no console"
featured: false
hidden: false
---

Hoje precisei fazer alguns testes em um projeto pessoal e sempre precisava iniciar um objeto admin e um objeto usuário.

Mas quando precisava testar novamente depois, precisava criar os objetos novamente.

Descobri que apartir do rails 6.1.4 podemos criar um arquivo `console_methods.rb` dentro de `config/initializers` e assim criar métodos que serão acessíveis no console.

```ruby
# config/initializers/console_methods.rb
module Rails::ConsoleMethods
  def admin
    @admin ||= Admin.first
  end

  def user
    @user ||= User.first
  end
end
```

Configurando um `Rails::ConsoleMethods` podemos criar métodos que serão acessíveis no console.

Para mais informações sobre o `Rails::ConsoleMethods` acesse:

https://api.rubyonrails.org/classes/Rails/ConsoleMethods.html

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
