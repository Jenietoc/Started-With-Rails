class ArticlesController < ApplicationController
  
  #http_basic_authenticate_with name: "jenietoc", password: "secret", except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete, :from_author]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(articles_params)
    redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(articles_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def from_author
    @user = User.find(params[:user_id])
  end

  private

  def articles_params
    params.require(:article).permit(:title, :body, :status)
  end
end
