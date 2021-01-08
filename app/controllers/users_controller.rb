class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(whitelist_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    def whitelist_params
        params.require(:user).permit(:username, :email, :password)
    end
end