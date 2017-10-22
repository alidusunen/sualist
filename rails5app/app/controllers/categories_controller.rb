class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :answer, :top]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @categories = Category.all
    end
    def show
        @questions = @category.questions
    end
    def new
        @category = Category.new
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    def create
        
        @category = Category.new(category_params)
        
            if @category.save 
                redirect_to '/categories'
            else
                render 'new'
            end
    
    end
    def answer
        @questions = @category.questions
    end
    def top
        @questions = @category.questions
    end

    
    private
        def category_params
            params.require(:category).permit(:name)
        end  
        def set_category
            @category = Category.find(params[:id])
        end
        
end
