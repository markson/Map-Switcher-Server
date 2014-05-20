require 'bundler/setup'
Bundler.require(:default, :development)
require_relative 'main'
app = MapSwitcherServer.new
Rack::Handler::WEBrick.run(app, Port:4567)
