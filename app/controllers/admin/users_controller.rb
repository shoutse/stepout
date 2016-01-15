class Admin::UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :check_admin
      before_action :set_user, :only => [:show, :edit, :update, :destroy]

     def index
        @users = User.all
     end

     def show

     end


     def edit

     end

     def update
        if @user.save
          flash[:alert] = "修改成功"
          redirect_to admin_users
        else
          render :action => :edit

        end
     end

     def destroy
        @user.destroy
        flash[:alert] = "刪除成功"
        redirect_to admin_users
     end


     private

     def set_user
       @user = User.find(params[:id])
     end


end
