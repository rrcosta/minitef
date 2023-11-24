require 'logger'

class Logging
  attr_reader :logger

  def initialize(app)
    @app = app
    @logger = Logger.new('log/development.log')
  end

  def call(env)
    request = Rack::Request.new(env)
    params_received = request.params

    msg = "#{env['REQUEST_METHOD']}: #{env['REQUEST_PATH']} "
    msg << " - Params:: \n #{params_received}" unless params_received.empty?

    logger.info(msg)

    # call the next middleware or our application
    @app.call(env)
  rescue => e
    logger.error("Oops, something went wrong. Error: #{e.message}")
    [200, { 'Content-Type' => 'text/html' }, ["Error: #{e.message}"]]
  end
end