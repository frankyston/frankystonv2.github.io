---
layout: post
title: "Como restaurar banco de dados local do Heroku"
author: frankyston
categories: [dicas, postgres]
image: assets/images/postgresql.png
description: "Dica simples de restaurar dump do Heroku em localhost"
featured: false
hidden: false
---

Esse dias precisei fazer pegar um dump de produção para testar um bug.

E queria poder restaurar o banco de dados de produção do Heroku na minha maquina.

E para fazer isso é bem simples, segue a dica e seja feliz ;)

#### Único comando para ser feliz

```bash
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d [db_name] production.dump
```
Dica retirada deste gist [https://gist.github.com/wrburgess/5528649](https://gist.github.com/wrburgess/5528649)

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
