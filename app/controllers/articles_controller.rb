class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
   # render plain: params[:article].inspect #show what was just created
    @article = Article.new(article_params) #white list values, create method #article_params
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "Article was successfully updated"
        redirect_to article_path(@article)
      else
        render :edit
      end
  end
  
  def index
    @articles = Article.all
  end
  
  def destroy # action
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description) #top level key is article   
    end
  
end