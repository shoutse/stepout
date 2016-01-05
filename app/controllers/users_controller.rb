class UsersController < ApplicationController
	 before_action :authenticate_user!, :except => [:show]
 
   def show
     @user = User.find( params[:id] )
 
     @topics = @user.topics
   end
 
   def edit
     @user = current_user
   end
 
   def update
     @user = current_user
     # ....
   end

end
