class LikesController < ApplicationController

   before_action :set_topic
   before_action :authenticate_user!

   # like
   def create
     current_user.likes.create!(topic: @topic)

     redirect_to :back
   end

   # unlike
   def destroy
     like = current_user.likes.find( params[:id] )
     like.destroy

     redirect_to :back
   end

end
