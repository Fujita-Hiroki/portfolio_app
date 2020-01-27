FROM ruby:2.7.0

# 作業ディレクトリ作成
RUN mkdir /portfolio_app
# 作業ディレクトリ名をAPP_ROOTに割り当て
ENV APP_ROOT /portfolio_app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock

RUN apt-get update && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn && \
    apt-get install --no-install-recommends yarn && \
    gem install bundler && \
    bundle install
