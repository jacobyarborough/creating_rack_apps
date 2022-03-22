require 'rack'

# creating first rack app 
handler = Rack::Handler::Thin

class RackApp 
  def call(env)
    req = Rack::Request.new(env)

    [200, {"Content-Type" => "text/plain"}, ["Hello from Rack"]]
  end 
end 

#creating first middleware
class FilterLocalHost
  def initialize(app)
    @app = app 
  end 

  def call(env)
    req = Rack::Request.new(env)

    if req.ip == "::1"
      [403, {}, "Localhost not allowed"]
    else 
      @app.call(env)
    end 
  end 
end 



handler.run RackApp.new