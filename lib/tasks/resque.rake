require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment do
  ENV['QUEUE'] = '*'
end

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'
    require 'resque/scheduler'

    Resque.schedule = YAML.load_file("#{Rails.root}/config/schedule.yml")
  end
end
