
class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]
skip_before_action :authenticate_user!, only: [:show, :index] 

def index
  #binding.pry
    @articles = Article.all 
end

def show 
    @comment = Comment.new
    @comment.article_id = @article.id
end

def new
    @article = Article.new
end

def edit
  end


def create
    @article = Article.new(article_params)
    #@article.image.attach(params[:image])
    if current_user.id == @article.user_id && @article.save
        redirect_to @article
    else
        render 'new'
    end
  end

  def update
    if current_user.id == @article.user_id 
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
  end


  def destroy
    #binding.pry
    if current_user.id == @article.user_id
      @article.destroy
      redirect_to articles_path
    else 
      flash.alert = "You cannot delete"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image, :user_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end 
  
end
