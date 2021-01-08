class ArticlesController < ApplicationController
    before_action :find, only:[:show, :update, :destroy, :edit]
    def show
        
    end

    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(white_list_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Added an article!!"
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update    
        @article.update(white_list_params)
        if @article.save
            flash[:notice] = "Updated an article!!"
            redirect_to @article           
        else
            render 'edit'
        end
    end

    def destroy
        flash[:notice] = "deleted article #{params[:id]}!!"
        @article.destroy
        redirect_to articles_path
    end

    private
    def find
        @article = Article.find(params[:id])
    end

    def white_list_params
        params.require(:article).permit(:title, :description)
    end
end