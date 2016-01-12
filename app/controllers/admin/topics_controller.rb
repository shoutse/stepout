class Admin::TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  def index
    @industries=Industry.all
end

protected

    def check_admin
      unless current_user.admin?
        flash[:alert]="no permission"
        raise AvtiveRecord::RecordNotFound
      end
    end


  # def authenticate
     # authenticate_or_request_with_http_basic do |user_name, password|
       # user_name == "username" && password == "password"
     # end
  # end


end
