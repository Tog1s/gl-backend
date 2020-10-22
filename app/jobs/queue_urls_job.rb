class QueueUrlsJob < ApplicationJob
  queue_as :default

  def perform(urls)
    redis = Redis.new(
        host: "redis",
        reconnect_attempts: 8,
        reconnect_delay: 2
    )
    redis.set "urls", urls.to_json
  end
end
