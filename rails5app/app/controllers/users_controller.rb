class UsersController < ApplicationController
  def profile
    @user= User.find(params[:id])
    @questions = @user.questions
    @answers = @user.answers
    @categories = @user.all_following
  end
end
