# encoding: utf-8
require "sinatra"
require "dotenv"
require "net/http"

configure do
  # Load .env vars
  Dotenv.load
  # Disable output buffering
  $stdout.sync = true
end

post "/yo/:username" do
  Net::HTTP.post_form(URI.parse("http://api.justyo.co/yo/"),
                      { "api_token" => ENV["API_TOKEN"],
                        "username" => params[:username],
                        "link" => "https://dashboard.heroku.com/apps/#{params[:app]}" })
  status 200
  body "ok"
end