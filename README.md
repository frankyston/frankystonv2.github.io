# Blog Frankyston Lins

Post de referência para dockerizar o jekyll:
https://alfredfrancis.in/easily-manage-your-jekyll-sites-using-docker-compose-and-jekyll-admin/

## How to use

```
bundle exec jekyll serve --livereload
```

### Build image and run container

```
make start
```

### After image created, for execute container on second time
```
docker compose up -d
```
