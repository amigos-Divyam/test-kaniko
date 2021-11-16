FROM 000379120260.dkr.ecr.eu-west-2.amazonaws.com/ruby:2.6.5
# FROM ruby:2.6.5

ARG RAILS_ROOT=/app
ENV RAILS_ENV=production
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 \
      --binstubs

COPY . .

ENTRYPOINT ["/app/start.sh"]
CMD ["/app/bin/puma", "-C", "/app/config/puma.rb"]
