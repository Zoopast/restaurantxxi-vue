
FROM ruby:3.1.4

LABEL maintainer="Gabriel San Martín <ga.sanmartina@duocuc.cl"

RUN apt-get update -yqq
RUN apt-get install -yqq build-essential zip unzip libpq-dev libaio1 libaio-dev yarn

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
      apt-get install -y nodejs build-essential

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn

ENV APP_HOME=/usr/src/app

COPY . $APP_HOME

RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc

WORKDIR $APP_HOME
RUN chmod +x docker-rails.sh
RUN chmod +x docker-vite.sh
RUN yarn install --check-files
RUN bundle install
RUN test -f tmp/pids/server.pid && rm -f tmp/pids/server.pid; true

CMD ["rails", "s", "-e", "production"]