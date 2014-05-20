require 'bundler/setup'
Bundler.require(:default, :development)
require './main.rb'
app = MapSwitcherServer.new
Rack::Handler::WEBrick.run(app, Port:4567)
