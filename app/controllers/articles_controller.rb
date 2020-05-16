class ArticlesController < ApplicationController
  before_action :load_article, only: %i[edit update show destroy]

  def index
    @articles = ArticleSearch.new(:all_articles, {}).execute
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: 'Article has been created successfully!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Article has been updated successfully!'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article has been deleted successfully!'
    else
      flash[:alert] = 'Error! unable to delete article at the moment!'
    end

    redirect_to articles_path
  end

  private

  def load_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :state)
  end
end
