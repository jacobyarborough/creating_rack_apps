require 'rack'


handler = Rack::Handler::Thin

class RackApp 
  def call(env)
    req = Rack::Request.new(env)

    [200, {"Content-Type" => "text/plain"}, ["Hello from Rack"]]
  end 
end 

handler.run RackApp.new