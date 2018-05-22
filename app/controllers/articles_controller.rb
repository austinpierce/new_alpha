class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  # calling find params method for edit, update, show, destroy
  
  def new
    @article = Article.new
  end
  
  def create
   # render plain: params[:article].inspect #show what was just created
    @article = Article.new(article_params) #white list values, create method #article_params
    @article.user = User.first #temporarily hardcode user
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
      if @article.update(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to article_path(@article)
      else
        render :edit
      end
  end
  
  def index
    @articles = Article.all
  end
  
  def destroy # action
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description) #top level key is article   
    end
  
    def set_article
      @article = Article.find(params[:id])
    end
  
end