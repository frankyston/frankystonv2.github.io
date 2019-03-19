# Blog Frankyston Lins

**Mediumish for Jekyll** is designed and developed by [Sal](https://www.wowthemes.net) and it is _free_ under MIT license.

## How to use

```
git clone https://github.com/wowthemesnet/mediumish-theme-jekyll.git

cd mediumish-theme-jekyll

bundle
```

Edit `_config.yml` options. If your site is in `root: baseurl: ''`. Also, change your Google Analytics code, disqus username, authors, Mailchimp list etc.

```
jekyll serve --watch
```

Start by adding your .md files in `_posts`. Mediumish already has a few examples.
YAML front matter

- featured post - `featured:true`
- exclude featured post from “All stories” loop to avoid duplicated posts - `hidden:true`
- post image - `image: assets/images/mypic.jpg`
- external post image - `image: "https://externalwebsite.com/image4.jpg"`
- page comments - `comments:true`
- meta description (optional) - `description: "this is my meta description"`

### YAML Post Example:

```Yaml
---
layout: post
title:  "We all wait for summer"
author: john
categories: [ Jekyll, tutorial ]
image: assets/images/5.jpg
description: "Something about this post here"
rating: 4.5
---
```

### YAML Page Example

```Yaml
---
layout: page
title: Mediumish Template for Jekyll
comments: true
---
```
