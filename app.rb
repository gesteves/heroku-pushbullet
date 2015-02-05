# encoding: utf-8
require "sinatra"
require "json"
require "httparty"
require "dotenv"

configure do
  # Load .env vars
  Dotenv.load
  # Disable output buffering
  $stdout.sync = true
end

post "/notify/:token" do
  if params[:token] == ENV["APP_TOKEN"]
    payload = {
      :type => "note",
      :title => "#{params[:app]} deployed to Heroku",
      :body => "#{params[:user]} deployed version #{params[:head]} of #{params[:app]}"
    }
    auth = {
      :username => ENV["PUSHBULLET_TOKEN"],
      :password => ""
    }
    HTTParty.post("https://api.pushbullet.com/v2/pushes",
                  :basic_auth => auth,
                  :body => payload.to_json,
                  :headers => { "Content-Type" => "application/json" })
    status 200
    body "ok"
  else
    status 403
    body "nope"
  end
end