class UsersController < ApplicationController
def show
  bearer_token= Twitter.generate_bearer_token

    api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
url = "https://api.twitter.com/1.1/users/show.json?screen_name=#{params[:id]}"
render json: HTTParty.get(url, headers: api_auth_header).body
end
end
