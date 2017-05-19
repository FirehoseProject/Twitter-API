class Twitter
  def self.generate_bearer_token
    consumer_key = ENV['TWITTER_PUBLIC_KEY']
    consumer_secret = ENV['TWITTER_SECRET_KEY']

    credentials = Base64.encode64("#{consumer_key}:#{consumer_secret}").gsub("\n", '')
    url = "https://api.twitter.com/oauth2/token"
    body = "grant_type=client_credentials"
    headers = {
      "Authorization" => "Basic #{credentials}",
      "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"
    }

    r = HTTParty.post(url, body: body, headers: headers)
    JSON.parse(r.body)['access_token']
  end
end
