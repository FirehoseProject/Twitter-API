class TweetsController < ApplicationController
  def index
  bearer_token= Twitter.generate_bearer_token

    api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
url = "https://api.twitter.com/1.1/search/tweets.json?q=#{params[:keyword]}"
if params[:hashtag].present?
url = "https://api.twitter.com/1.1/search/tweets.json?q=%23#{params[:hashtag]}"
end
 render json: HTTParty.get(url, headers: api_auth_header).body

  end
end
