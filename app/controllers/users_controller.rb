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

   def new
      @user=User.new

   end

   def create

      @user = User.new( event_params )

     if @user.save
      flash[:notice] = "註冊成功"
        redirect_to welcome_path
     else
      render :action => :new
     end
   end


   def update
     @user = current_user

     if @user.update(user_params)

      flash[:notice] = "編輯成功"

      redirect_to :back
      else
        render :action => :edit

      end
   end

   private

   def user_params
      params.require(:user).permit(:name, :photo)
   end
end
