Lita.configure do |config|

  config.robot.name = "Bit Girl"
  config.robot.mention_name = "botgirl"

  config.robot.adapter = :slack
  config.adapters.slack.token = "xoxb-3717898382-q14qqQMNjbmjy45BP48kz53L"

  config.redis.url = ENV["REDISTOGO_URL"]
  config.http.port = ENV["PORT"]

  config.robot.locale = :en

  config.robot.log_level = :info
  # :debug, :info, :warn, :error, :fatal

  # config.robot.alias = "/"
  # config.redis[:host] = "redis.example.com"

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234

  config.handlers.google_images.safe_search = :active
  config.handlers.giphy.api_key = "dc6zaTOxFJmzC"

  config.handlers.karma.cooldown = 300
  config.handlers.karma.term_normalizer = lambda do |full_term|
    term = full_term.to_s.strip.sub(/[<:]([^>:]+)[>:]/, '\1')
    user = Lita::User.fuzzy_find(term.sub(/\A@/, ''))

    if user
      normalized_karma_user_term.call(user.id, user.name)
    else
      term.downcase
    end
  end

  config.handlers.slack_karma_sync.user_term_normalizer = normalized_karma_user_term

  normalized_karma_user_term = ->(user_id, user_name) {
    "@#{user_id} (#{user_name})" #=> @UUID (Liz Lemon)
  }

end
