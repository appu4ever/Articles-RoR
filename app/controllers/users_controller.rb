class UsersController < ApplicationController
    before_action :find, only: [:edit, :update]

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

    def edit

    end

    def update
        @user.update(whitelist_params)
        if @user.save
            flash[:notice] = "User account updated"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    private

    def whitelist_params
        params.require(:user).permit(:username, :email, :password)
    end

    def find
        @user = User.find(params[:id])
    end
end