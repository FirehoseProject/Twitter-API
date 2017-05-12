class UsersController < ApplicationController
def show
  bearer_token= "AAAAAAAAAAAAAAAAAAAAAKz30QAAAAAAQWRTwnPvMdC8xF9hGbVhu19W9II%3DoEfIKbzjR9RuwyDRV0rwFx3yDQPnnVtiwOybvOlDDOyFErpDlO";

    api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
url = "https://api.twitter.com/1.1/users/show.json?screen_name=#{params[:id]}"
render json: HTTParty.get(url, headers: api_auth_header).body
end
end
