module Rack
  class Catcher
    
    def initialize(app)
      @app = app
    end
    
    def call(env)
      begin
        response = @app.call(env)
      rescue => ex
        "error"
      end
      response
    end
    
  end
end
