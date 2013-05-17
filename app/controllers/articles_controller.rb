class ArticlesController < ApplicationController

  before_filter :require_login, except: [:show, :index]

  def require_login
    unless current_user
      redirect_to root_path
      return false
    end
  end

  def index
    @articles = Article.published

    respond_to do |format|
      format.html
      format.rss { render :rss => @articles }
      format.json { render :json => @articles }
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @article.add_to_view_count
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  
  def edit
    @article = Article.find(params[:id])
    unless current_user.id == @article.author_id
      flash.notice = "You are not the author of this article!"
      redirect_to article_path(@article)
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.author_id = current_user.id
    @article.published = true
    @article.save
    flash.notice = "Article '#{ @article.title }' Created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{ @article.title }' Deleted!"
    redirect_to articles_path
  end

  def index_by_month_year
    year = params[:year]
    month = params[:month]
    year = Time.now.year.to_s if year.nil?
    month = Time.now.month.to_s if month.nil?

    @date = Time.new(year,month).strftime("%B %Y")
    @articles = Article.by_month_and_year(month,year)
  end

end
