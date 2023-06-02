FROM jekyll/jekyll:latest

RUN gem install wdm

# RUN gem install github-pages
RUN gem install webrick
RUN gem install jekyll-feed
RUN gem install jekyll-sitemap
RUN gem install jekyll-paginate
RUN gem install jekyll-seo-tag
RUN gem install jekyll-archives
RUN gem install kramdown
RUN gem install rouge
