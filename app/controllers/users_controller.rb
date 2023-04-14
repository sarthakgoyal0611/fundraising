class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def destroy
        @user.destroy
        session[:user_id] = nil
        flash[:notice] = "Account and all associated articles successfully deleted"
        redirect_to events_path
      end
      
      def search_user 
        @get_user = User.all.where(" first_name LIKE ?", "%#{params[:first_name]}%" )
        # p "========================================"

        # p @get_events
        # p "---------------------------------------"

    end

      
end
