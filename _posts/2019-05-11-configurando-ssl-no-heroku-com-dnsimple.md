---
layout: post
title: "Configurando certificado SSL no Heroku com DNSimple"
author: frankyston
categories: [dicas, heroku, ssl, dnsimple]
image: assets/images/heroku-plus-dnsimple.jpg
description: "Configurando certificado SSL no Heroku com DNSimple"
featured: false
hidden: false
---

Hoje precisei configurar um app no [Heroku](https://heroku.com) com certificado coringa (wildcard) no Heroku.

Depois de algumas pesquisas descobri como configurar. Lembrando que essa não é a única alternativa para resolver esse problema.

Primeiro criei uma conta no [DNSimple](https://dnsimple.com), comprei o domínio e após realizar a compra existe uma opção chamada `SSL Certificates`.

Nessa opção basta seguir o passo a passo para solicitar um certificado. 

Primeiro você vai na opção SSL certificates, depois clica em `new certificate`
![Solicitando Certificado SSL no DNSimple](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple3.png)

Segundo escolhi a opção Let's Encrypt
![Solicitando Certificado SSL no DNSimple](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple1.png)

Depois informei `*` para dizer que o certificado é um coringa `wildcard`. Preenchi o restante das informações e cliquei em `Create certificate order`.

![Solicitando Certificado SSL no DNSimple](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple2.png)

Eu decidi escolher o certificado gerado pelo Let's Encrypt pois será gratuíto, caso deseje comprar será cobrado da sua conta $100 dolares.

Aguarde por 30 minutos e receberá um e-mail informando que você já pode baixar seu certificado e configurar no seu domínio.

Para configurar, basta acessar o seu domínio no DNSimple, clicar sobre o nome do certificado gerado.

![Solicitando Certificado SSL no DNSimple](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple3.png)

Você será levado para uma página com as informações do certificado. Logo abaixo você verá um botão chamado `install`.

![Instalando certificado no Heroku](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple4.png)

Na página seguinte, surgirá varias opções para você poder instalar o seu certificado,
clique sobre a opção Heroku, ele te mostrará um tutorial de como instalar.

![Instalando certificado no Heroku](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple5.png)

O passo é bem simples, basta baixar os certificado `.pem` e `.key` e execute os seguintes comandos:

#### Instalando Certificados

```bash
heroku certs:add CAMINHO_DO_ARQUIVO/SEU_CERTIFICADO.pem CAMINHO_DO_ARQUIVO/SEU_CERTIFICADO.key
heroku certs
```

O primeiro comando, irá instalar o certificado no seu app heroku.

O segundo comando, se tudo estiver instalado corretamente, ele listará o seu certificado.

#### Configurando o seu domínio

No Heroku Adicione, dois domínios nas configurações do seu app.

O primeiro com domínio curinga `*.seudominio.com` e o segundo com www `www.seudominio.com`

No DNSimple basta você copiar a url do domínio curinga e registrar `CNAME` do curinga e do www para a mesma url.

![Heroku domínios](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple6.png)

Exemplo:

Digamos que eu cadastrei no heroku `*.seudominio.com` e `www.seudomino.com`, o heroku vai gerar duas urls diferente para os dois domínios cadastro no app heroku. No DNSimple vou pegar a url do `*.seudominio.com` e registrar o `CNAME` para os dois registros DNS `*` como `www`.

Para finalizar crie um registro Alias apontando `seudominio.com` sem o www para redirecionar para o `www.seudominio.com` com www.

A imagem abaixo é um exemplo de como ficou os registros no DNSimple.

![Configurando os registros no DNSimple](/assets/images/heroku-dnsimple/ssl-horoku-dnsimple7.png)

Desta forma, seu app heroku vai funcionar com certificado SSL de qualquer sub-domínio do seu domínio principal.

Bom, é isso, qualquer dúvida comente abaixo.

Até o próximo post.
