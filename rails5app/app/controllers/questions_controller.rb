class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :new, :edit, :update, :destroy, :upvote, :downvote]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @questions = Question.all
    end
    
    def show
        @answers = @question.answers
    end
    def new
        @question = current_user.questions.build
    end
    
    def edit
    end
    def create
        
        @question = current_user.questions.build(question_params)
        
            if @question.save 
                redirect_to root_path
            else
                render 'new'
            end
    
    end
    
    def update
            if @question.update_attributes(question_params)
                redirect_to :action => 'index'
            end
    end
    def destroy
        
        @question.destroy
        redirect_to '/questions'
    end
    def upvote
        @question.upvote_from current_user
        redirect_to questions_path
    end
    def downvote
        @question.downvote_from current_user
        redirect_to questions_path
    end
    

        
    
    private
        def question_params
            params.require(:question).permit(:text, :category_id)
        end    
        def set_question
             @question = Question.find(params[:id])
        end
    

    
end
