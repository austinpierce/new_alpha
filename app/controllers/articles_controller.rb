class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
   # render plain: params[:article].inspect #show what was just created
    @article = Article.new(article_params) #white list values, create method #article_params
    @article.save
    redirect_to articles_show(@article)
  end
  
  def show
    
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description) #top level key is article   
    end
  
end