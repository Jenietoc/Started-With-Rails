class ArticlesController < ApplicationController
  
  #http_basic_authenticate_with name: "jenietoc", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def login
    puts 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'
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
      redirect_to @article
    else
      render :new
    end
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
    params.require(:article).permit(:title, :body, :status)
  end
end
