class Admin::PositionsController < ApplicationController
        before_action :authenticate_user!
        before_action :check_admin
        before_action :set_position, :only => [:show, :edit, :update, :destroy]

     def index
        @positions = Position.all
     end

     def show

     end

     def new
          @position = Position.new
     end

     def create
          @position = Position.new(position_params)
        if @position.save
          flash[:alert] = "新增成功"
          redirect_to admin_positions_path
        else
        render :action => :new
        end
     end

     def edit

     end

     def update
        if @position.update
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


     private

    def set_position
      @position =Position.find(params[:id])
    end

    def check_admin
      unless current_user.admin?
        raise AvtiveRecord::RecordNotFound
      end
    end


    def position_params
       params.require(:position).permit(:name)
     end

end
