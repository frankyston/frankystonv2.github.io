---
layout: post
title: "Habilitar Instalação de pacotes do NodeJS global no mac"
author: frankyston
categories: [dicas, node, mac]
image: assets/images/nodejs.jpeg
description: "Habilitar Instalação de pacotes do NodeJS global no mac"
featured: false
hidden: false
---

 Habilitar Instalação de pacotes do NodeJS global no mac

Hoje iniciei os estudos com React Native, quando instalei o NodeJS e NPM tive um problema com a instalação do React Native.

Ao executar `npm install -g react-native-cli` meu mac não tinha permissão para instalar no diretório padrão configurado pelo npm.

Para resolver esse problema é bastante simples, basta seguir o passo a passo abaixo.

Crie um diretório para instalações globais:

```bash
mkdir ~/.npm-global
```

Configure o npm para usar o novo caminho do diretório:

```bash
npm config set prefix '~/.npm-global'
```

Abra ou crie um arquivo ~ /.profile e adicione esta linha:

```bash
export PATH=~/.npm-global/bin:$PATH
```

No terminal execute:

```bash
source ~/.profile
```

E finalmente execute o que deseja instalar:

```bash
npm install -g react-native
```

Depois desse passo a instalação funcionou perfeitamente :)))

Dica retirada deste post [https://github.com/facebook/reason/issues/1888](https://github.com/facebook/reason/issues/1888)

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
