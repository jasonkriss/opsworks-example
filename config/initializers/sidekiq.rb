config = YAML::load_file(Rails.root.join('config', 'redis.yml'))

redis_opts = {
  url: "redis://#{config['host']}:#{config['port']}/0",
  namespace: 'opsworks.example.sidekiq'
}

Sidekiq.configure_server { |c| c.redis = redis_opts }
Sidekiq.configure_client { |c| c.redis = redis_opts }
