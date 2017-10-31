class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #debugger
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "The article was created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "The article was updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was deleted!"
    redirect_to articles_path
  end


  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edin or delete your onw articles!!!!"
      redirect_to root_path
    end
  end
end
