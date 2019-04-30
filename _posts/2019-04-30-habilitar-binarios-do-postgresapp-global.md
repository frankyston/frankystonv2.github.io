---
layout: post
title: "Habilitar os binários do Postgres.app global no terminal"
author: frankyston
categories: [dicas, postgresql, terminal]
image: assets/images/postgresql.png
description: "Habilitar os binários do Postgres.app global no terminal"
featured: false
hidden: false
---

#### Habilitar os binários do Postgres.app global no terminal

Hoje precisei fazer um pg_dump de um banco de dados de produção na minha máquina.

Para banco de dados PostgreSQL gosto de usar o [Postgres.app](https://postgresapp.com), um app para macOS muito legal e fácil de instalar. 

Mas ele não vem com todos os binários habilitados para você usar no terminal.

Mas esse problema é simples de resolver:

```bash
sudo mkdir -p /etc/paths.d &&
echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
```

Para ter certeza que tudo deu certo, digite o comando abaixo e veja o local aonde ele está instalado:

```bash
which psql
```

Dica retirada deste post [https://postgresapp.com/documentation/cli-tools.html](https://postgresapp.com/documentation/cli-tools.html)

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
