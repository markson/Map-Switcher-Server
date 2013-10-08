require 'bundler/setup'
Bundler.require(:default, :development)
require './main.rb'
app = MapSwitcherServer.new
Rack::Handler::Thin.run(app, Port:4567)
