class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find(params[:id])
        @rel = @user.followers.find_by(follower: current_user)
    end
end
