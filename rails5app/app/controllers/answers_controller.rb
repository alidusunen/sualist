class AnswersController < ApplicationController
        before_action :set_answer, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
        before_action :authenticate_user!, except: [:index, :show]
    def show
        @question = @answer.question_id
        redirect_to question_path(@question)
    end
    def new
        @answer = Answer.new
    end
    
    def edit
        @question = Question.find(params[:question_id])
    end
    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.new(answer_params)        
        @answer.user = current_user
        
            if @answer.save 
                redirect_to question_path(@question)
            else
                render 'new'
            end
    end
    
    def update
            @question = Question.find(params[:question_id])
            if @answer.update_attributes(answer_params)
                redirect_to question_path(@question)
            else
                redirect_to '/questions'
            end
        
    end
    def destroy
        @question = Question.find(params[:question_id])
        @answer.destroy
        redirect_to question_path(@question)
    end
    def upvote
        @question = @answer.question_id
        @answer.upvote_by current_user
        redirect_to question_path(@question)
    end
    def downvote
        @question = @answer.question_id
        @answer.downvote_by current_user
        redirect_to question_path(@question)
    end
    private
        def answer_params
            params.require(:answer).permit(:text, :question_id)
        end    
        def set_answer
            @answer = Answer.find(params[:id])
        end
        
        
end
