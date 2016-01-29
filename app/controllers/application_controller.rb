class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


	protected

  def check_admin
    unless current_user.admin?
      raise AvtiveRecord::RecordNotFound
    end
  end

	def configure_permitted_parameters

    [:name, :birthday, :major, :occupation, :school, :former_occupation, :role, :photo, :introduction].each do |col|
      devise_parameter_sanitizer.for(:sign_up) << col
      devise_parameter_sanitizer.for(:account_update) << col
    end

    # TODO
  #   devise_parameter_sanitizer.for(:account_update) <<:photo
		# devise_parameter_sanitizer.for(:account_update) <<:name
		# devise_parameter_sanitizer.for(:account_update)<<:birthday
		# devise_parameter_sanitizer.for(:account_update)<<:major
		# devise_parameter_sanitizer.for(:account_update)<<:occupation
		# devise_parameter_sanitizer.for(:account_update)<<:school
		# devise_parameter_sanitizer.for(:account_update)<<:former_occupation
		# devise_parameter_sanitizer.for(:account_update)<<:role
  #   devise_parameter_sanitizer.for(:account_update)<<:introduction
	end

  def set_topic
    @topic = Topic.find( params[:topic_id] )
  end

end
