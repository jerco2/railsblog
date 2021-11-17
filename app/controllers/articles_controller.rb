class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy]

    def index
        @articles = Article.all 
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articles_path, notice: 'An article was successfully created.'
        else
            flash[:error] = "There are some errors encountered."
            render :new
        end
    end

    def edit
    end
    
    def update
        if @article.update(article_params)
            redirect_to articles_path, notice: 'An article was successfully updated.'
        else
            flash[:error] = "There are some errors encountered."
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :author, :content)
    end

end
