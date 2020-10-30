require 'resque'
require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(:host => "localhost", :port => "6379")

Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))

Resque.logger.level = Logger::INFO
