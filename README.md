Twitter EgoSearch Skype
=======================
search on Twitter and notify with Slack.

- https://github.com/shokai/twitter-egosearch-slack

Requirements
------------
- Ruby 1.9.3~2.0.0
- MongoDB 2.0


Install Dependencies
--------------------

    % gem install bundler
    % bundle install


Setup
-----

### Twitter
twitter-egosearch-skype uses [Tw](http://shokai.github.io/tw/) to use Twitter API.

    % tw --user:add
    % tw --user:list


### Slack
add slackbot integration and get token

- https://YOUR-TEAM.slack.com/services/new/slackbot


### config.yml

    % cp sample.config.yml config.yml


Run
---

    % MONGOID_ENV=development bundle exec ruby bin/egosearch.rb
    % MONGOID_ENV=production bundle exec ruby bin/egosearch.rb
