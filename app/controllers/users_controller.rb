class UsersController < ApplicationController
	 before_action :authenticate_user!, :except => [:show]
 
   def show
     @user = User.find( params[:id] )
 

 		 if params[:me]
 		 		@topics = @user.topics.page( params[:page] ).per(10)
 		 else
     		@topics=@user.subscription_topics.page( params[:page] ).per(10)
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
