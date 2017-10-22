class FollowersController < ApplicationController
    def create
        @category = Category.find(params[:id])
        current_user.follow(@category)
        redirect_to category_path(@category)
    end
    def destroy
        @category = Category.find(params[:id])
        current_user.stop_following(@category)
        redirect_to category_path(@category)
    end
end
