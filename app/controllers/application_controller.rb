class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
         events_path
     end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,
                                                                        :last_name,
                                                                        :email,
                                                                        :dob,
                                                                        :password, 
                                                                        :avatar)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, 
                                                                                :last_name, 
                                                                                :email, 
                                                                                :password, 
                                                                                :current_password)}
          end

          # def current_user
          #      @current_user ||= User.find(session[:user_id]) if session[:user_id]
          # end



end
