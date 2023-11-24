require 'singleton'

class Router
  include Singleton

  attr_reader :routes
  class << self
    def draw(&blk)
      Router.instance.instance_exec(&blk)
    end
  end

  def initialize
    @routes = {}
  end

  def get(path, &blk)
    if blk
      @routes[path] = blk
    else
      if path.include?('/')                   # 'articles/index'
        @routes['/' + path] = ->(env){
          # 'articles', 'index'
          controller_name, action_name = path.split('/')

          # ArticlesController
          controller_klass = constantize(controller_name)

          # controller = ArticlesController.new(env)
          controller = controller_klass.new(env)

          # controller.index
          controller.send(action_name)

          controller.render("views/#{controller_name}/#{action_name}.html.erb")
        }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']

    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end

  private

  def constantize(name)
    # "ArticlesController" (a string)
    controller_klass_name = name.capitalize + 'Controller'

    # ArticlesController  (a class)
    Object.const_get(controller_klass_name)
  end
end