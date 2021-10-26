class ArticlesController < ApplicationController
  
  #http_basic_authenticate_with name: "jenietoc", password: "secret", except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]

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
    @article = Article.new(articles_params)
    if @article.save
      puts @article.errors.full_messages
      redirect_to @article
    else
      #render :new
    end

    @article = Article.create(title: params[:article][:title],
                              body: params[:article][:body],
                              status: params[:article][:status],
                              user: current_user)
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

  private

  def articles_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
