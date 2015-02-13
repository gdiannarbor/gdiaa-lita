Lita.configure do |config|
  config.robot.name = "Bit Girl"
  config.robot.mention_name = "botgirl"

  config.robot.adapter = :slack
  config.adapters.slack.token = "xoxb-3717898382-HPxUxXzla4Lxe9iMtIjCpxc7"

  config.handlers.karma.cooldown = 300
  config.handlers.google_images.safe_search = :on

  config.robot.locale = :en

  # :debug, :info, :warn, :error, :fatal
  config.robot.log_level = :info

  # config.robot.alias = "/"
  # config.redis[:host] = "redis.example.com"

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234
end
