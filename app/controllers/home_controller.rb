class HomeController < ApplicationController
  def index; end

  def search
    articles = Article.match_by_keyword(params[:keyword])
    render json: { articles: articles.pluck(:id, :title) }
  end
end
