class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        if current_user != @user
            flash[:alert] = "You can't see Other User"
            redirect_to root_path
        end
    end

    def delete_user
        if current_user.is_admin

            @user= User.find(params[:id])
            @user.destroy

            flash[:notice] = "Account and all associated Events successfully deleted"
        else 
            flash[:alert] = "You can't delete this User."
        end
             redirect_to user_path

    end
      
    def search_user 
        @get_user = User.all.where(" first_name || last_name LIKE ?", "%#{params[:first_name]}%" )

        #  p "========================================"

        # p @get_user
        # p "---------------------------------------"

    end

      
end
