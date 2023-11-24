class ArticlesController < ApplicationController
  # GET /articles/index
  def index
    @title = 'Mini TEF'
    @article = Article.new('Simulação do Agente Sitef','Que Deus nos ajude')
  end
end
