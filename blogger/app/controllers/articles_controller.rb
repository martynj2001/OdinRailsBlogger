class ArticlesController < ApplicationController

	before_filter :require_login, except: [:index, :show]

	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@articles = Article.find(params[:id])
		@comment = Comment.new #Reflection
		@comment.article_id = @articles.id
	end

	def new
		@article = Article.new #Used for reflection so the Rails form helper knows what display in the view.
	end

	def create #Called from the New view (Submite Button)
		@article = Article.new(article_params)
		@article.save

		flash.notice = "New Article '#{@article.title}' Created"

		redirect_to article_path(@article)
	end

	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy

		flash.notice = "Article Deleted"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update #Called from the edit view (Update button)
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated"

		redirect_to article_path(@article)
	end

end
