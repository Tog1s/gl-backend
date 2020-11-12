module ServersHelper
  def get_status_code(server_id)
    status_code = Counter.where(servers_id: server_id).last
    if status_code.nil?
      'nil'
    else
      status_code.code
    end
  end

  def get_latency(server_id)
    latency = Counter.where(servers_id: server_id).last
    if latency.nil?
      'nil'
    else
      latency.delay
    end
  end
end
