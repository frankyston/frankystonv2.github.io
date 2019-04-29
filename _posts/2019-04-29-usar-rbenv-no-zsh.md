---
layout: post
title: "Usar Rbenv no ZSH"
author: frankyston
categories: [dicas, rbenv, zsh]
image: assets/images/ruby-rvm-rbenv.png
description: "Já teve problemas de carregar o Rbenv no ZSH?"
featured: false
hidden: false
---

#### Já teve problemas de carregar o Rbenv no ZSH?

Hoje estava precisando usar o Rbenv depois que instalei o ZSH e não funcionava.

Como sempre existe uma solução para um problema, a solução é bem simples:

```bash
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
$ echo 'eval "$(rbenv init -)"' >> ~/.zshenv
$ echo 'source $HOME/.zshenv' >> ~/.zshrc
$ exec $SHELL
```
Dica retirada deste post [https://coderwall.com/p/0o64yq/rbenv-issues-when-switching-to-zsh](https://coderwall.com/p/0o64yq/rbenv-issues-when-switching-to-zsh)

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
