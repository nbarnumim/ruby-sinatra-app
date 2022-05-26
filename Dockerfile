FROM ruby:2.7.5-alpine

COPY Gemfile Gemfile.lock /srv/app/
WORKDIR /srv/app
RUN bundle install
COPY app.rb config.ru /srv/app/
EXPOSE 9292

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0"]
