class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params[:user])
            if @user.save
                redirect_to :action => :index
                flash[:success] = "Welcome to the Alpha blog #{@user.username}"
            else
                render 'new'
            end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end