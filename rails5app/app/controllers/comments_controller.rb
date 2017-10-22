class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @answer = Answer.find(params[:question_id])
        @comments = @answer.comments
    end
    
    def show
        
    end
    
    def new
        @comment = Comment.new
    end
    
    def create
            @answer = Answer.find(params[:answer_id])
            @question = @answer.question_id
            @comment = @answer.comments.new(comment_params)        
            @comment.user = current_user
        
            if @comment.save 
                redirect_to question_path(@question)
            else
                render '/questions'
            end
    end
    
    def edit
    end
    
    def update
       
    
    end
    
    def destroy
    end

    def upvote
        @answer = @comment.answer_id
        @comment.upvote_by current_user
        redirect_to answer_path(@answer)
    end

    def downvote
        @comment.downvote_by current_user
        @answer = @comment.answer_id
        redirect_to answer_path(@answer)
    end
    private
    def comment_params
        params.require(:comment).permit(:text, :answer_id)
    end
    
    def set_comment
        @comment = Comment.find(params[:id])
    end
end

