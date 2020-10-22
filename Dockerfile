FROM tog1s/rails:2.7.1

ENV APP_HOME /app
WORKDIR $APP_HOME

ADD . $APP_HOME/

RUN bundle install && yarn install --check-files