class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?


	protected

    	def configure_permitted_parameters
      		
      		devise_parameter_sanitizer.for(:sign_up) << :name
      		devise_parameter_sanitizer.for(:sign_up) <<:birthday
      		devise_parameter_sanitizer.for(:sign_up) <<:major
      		devise_parameter_sanitizer.for(:sign_up) <<:occupation
      		devise_parameter_sanitizer.for(:sign_up) <<:school
      		devise_parameter_sanitizer.for(:sign_up) <<:former_occupation
      		devise_parameter_sanitizer.for(:sign_up) <<:role
      		devise_parameter_sanitizer.for(:account_update) <<:name
      		devise_parameter_sanitizer.for(:account_update)<<:birthday
      		devise_parameter_sanitizer.for(:account_update)<<:major
      		devise_parameter_sanitizer.for(:account_update)<<:occupation
      		devise_parameter_sanitizer.for(:account_update)<<:school
      		devise_parameter_sanitizer.for(:account_update)<<:former_occupation
      		devise_parameter_sanitizer.for(:account_update)<<:role
    	end

     def set_topic
        @topic = Topic.find( params[:topic_id] )
     end

  	
end
