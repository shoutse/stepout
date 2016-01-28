class Admin::PositionsController < ApplicationController
        before_action :authenticate_user!
        before_action :check_admin
        before_action :set_position, :only => [:show, :edit, :update, :destroy]
layout "admin"
     def index
        @positions = Position.all
     end

     def show

     end

     def new
         if params[:id]
           @position = Position.find(params[:id])
         else
           @position = Position.new
         end
     end

     def create
          @position = Position.new(position_params)
        if @position.save
          flash[:alert] = "新增成功"
          redirect_to admin_topics_path
        else
        render :action => :new
        end
     end

     def edit


     end

     def update
        if @position.update(position_params)
         flash[:alert] ="更新成功"
         redirect_to admin_positions_path
        else
            render :action => :edit

        end
     end

     def destroy
        @position.destroy
        flash[:alert] = "刪除成功"
        redirect_to admin_positions_path


     end


     protected

    def set_position
      @position =Position.find(params[:id])
    end

    def check_admin
      unless current_user.admin?
        raise AvtiveRecord::RecordNotFound
      end
    end


    def position_params
       params.require(:position).permit(:name, :photo)
     end

end
