---
layout: post
title: "O que é DRY?"
author: frankyston
categories: [tutorial, ruby, dica]
image: assets/images/dry-rails.jpg
description: "O que é DRY?."
featured: false
hidden: false
---

Talvez você já tenho ouvido falar de cara chamado DRY. Mas o que ele realmente é?

DRY ou  Don't Repeat Yourself é um princípio de desenvolvimento de software para reduzir a repetição de informações ou códigos. Podemos aplicar DRY de forma bastante ampla ao esquema do banco de dados, plano de teste, sistema e até mesmo documentação.

#### Exemplo de uma classe sem uso do DRY

```ruby
class User < ActiveRecord::Base

  def self.all_active
    where("state = ?", "active")
  end

  def self.all_inactive
    where("state = ?", "inactive")
  end

  def active?
    self.state == 'active'
  end

  def inactive?
    self.state == 'inactive'
  end

end
```

Observe que no código repetimos dois métodos para fazer a chamada de de ativos ou inativos pelo mesmo campo do banco de dados `state`.

#### Exemplo de uma classe com uso do DRY

```ruby
class User < ActiveRecord::Base

  STATES = ['active', 'inactive']

  class <<self
    STATES.each do |state_name|
      define_method "all_#{state_name}" do
        where("state = ?", state_name)
      end
    end
  end

  STATES.each do |state_name|
    define_method "#{state_name}?" do
      self.state == state_name
    end
  end

end
```

Como podem ver usamos o recurso da metaprogramação `define_method` para gerar dinamicamente os metodos `all_active`, `all_inactive`, `active?` e `inactive?`.

Tenha sempre em mente que tudo que for repetitivo no código sempre há uma maneira de usar o DRY ao seu favor.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
