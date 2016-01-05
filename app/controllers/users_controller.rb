class UsersController < ApplicationController
	 before_action :authenticate_user!, :except => [:show]
 
   def show
     @user = User.find( params[:id] )
 

 		 if params[:me]
 		 		@topics = @user.topics
 		 else
     		@topics=@user.subscription_topics
     end

   end
 
   def edit
     @user = current_user
   end
 
   def update
     @user = current_user
     # ....
   end

end
