bundle exec rake db:create db:migrate
BACKGROUND=yes rake environment resque:work
BACKGROUND=yes rake resque:scheduler
bundle exec rails s -p 3000 -b '0.0.0.0'
