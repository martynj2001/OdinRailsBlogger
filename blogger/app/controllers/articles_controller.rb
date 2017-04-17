class ArticlesController < ApplicationController

	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@articles = Article.find(params[:id])
	end

	def new
		@article = Article.new #Used for reflection so the Rails form helper knows what display in the view.
	end

	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to article_path(@article)
	end

	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy
		redirect_to article_path(@articles.id + 1)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		redirect_to article_path(@article)
	end

end
