require 'erb'
require 'zeitwerk'
require 'pry'
require 'json'
require_relative './config/routes'

class App
  def initialize
    loader = Zeitwerk::Loader.new
    load(loader)
  end

  def load(loader)
    loader.push_dir('models')
    loader.push_dir('controllers')
    loader.setup
  end

  def call(env)
    response_html = router.build_response(env)

    [
      200, headers, [response_html]
    ]
  end

  def headers
    #{ 'content-type' => 'application/html' }
    #{ 'content-type' => 'text/html' }

    { 'content-type' => 'application/json' }
  end

  def html_template
    File.read('views/index.html.erb')
  end

  private

  def router
    Router.instance
  end
end