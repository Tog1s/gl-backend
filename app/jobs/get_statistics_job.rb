class GetStatisticsJob < ApplicationJob
  # queue_as :default
  @queue = :statistics
  def perform
    redis = Redis.new(
      host: 'redis',
      reconnect_attempts: 8,
      reconnect_delay: 2
    )

    queue_data_present = true

    while queue_data_present
      response = redis.lpop 'statistics'
      if response.nil?
        queue_data_present = false
      else
        params = JSON.parse(response)
        Counter.create(servers_id: params['server_id'], code: params['code'], delay: params['delay'])
      end
    end
  end
end
