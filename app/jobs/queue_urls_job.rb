class QueueUrlsJob < ApplicationJob
  # queue_as :default
  @queue = :urls
  def perform
    redis = Redis.new(
      host: 'redis',
      reconnect_attempts: 8,
      reconnect_delay: 2
    )
    servers = Server.all
    redis.set 'urls', servers.to_json
  end
end
