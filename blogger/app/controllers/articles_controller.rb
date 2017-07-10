class ArticlesController < ApplicationController
include ArticlesHelper

def index # shows all articles in the db
	@articles = Article.all
end

def show # shows the specified article (by :id)
	@article = Article.find(params[:id])

	@comment = Comment.new
	@comment.article_id = @article.id
end

def new # creates the form/object to the new article
	@article = Article.new
end
def create # saves the article to the db
	@article = Article.new(article_params)
	@article.save

	flash.notice = "Article '#{@article.title}' created!"

	redirect_to article_path(@article)
end

def destroy
	@article = Article.find(params[:id])
	@article.destroy

	flash.notice = "Article '#{@article.title}' deleted!"

	redirect_to articles_path
end

def edit # finds the object and displays the form
	@article = Article.find(params[:id])
end
def update
	@article = Article.find(params[:id])
	@article.update(article_params)

	flash.notice = "Article '#{@article.title}' updated!"

	redirect_to article_path(@article)
end

end