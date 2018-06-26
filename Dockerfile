FROM ruby:2.5.1
MAINTAINER Admin rememberthatk@icloud.com

RUN apt-get update \
  && apt-get -y install nodejs \
                        postgresql-client \
                        vim tmux git curl less \
                        locales locales-all \
                        --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
