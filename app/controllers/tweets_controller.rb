class TweetsController < ApplicationController
  def index
   bearer_token= "AAAAAAAAAAAAAAAAAAAAAKz30QAAAAAAQWRTwnPvMdC8xF9hGbVhu19W9II%3DoEfIKbzjR9RuwyDRV0rwFx3yDQPnnVtiwOybvOlDDOyFErpDlO";

    api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
url = "https://api.twitter.com/1.1/search/tweets.json?q=#{params[:keyword]}"
if params[:hashtag].present?
url = "https://api.twitter.com/1.1/search/tweets.json?q=%23#{params[:hashtag]}"
end
 render json: HTTParty.get(url, headers: api_auth_header).body

  end
end
