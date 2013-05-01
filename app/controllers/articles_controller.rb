class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    flash.notice = "Article '#{@article.title}' Updated!"
    # 2 other ways to accomplish this flash notice
    #flash[:notice] = "Article '#{@article.title}' Updated!"
    #redirect_to article_path(@article), :notice => "Test Flash"
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    # 2 other Created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"
    # 2 other Deleted!"
    redirect_to articles_path
  end
end
