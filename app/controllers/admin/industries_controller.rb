class Admin::IndustriesController < ApplicationController
      before_action :authenticate_user!

      before_action :set_industry, :only => [:show, :edit, :update, :destroy]

     def index
        @industries = Industry.all
     end

     def show

     end

     def new
          @industry=Industry.new
     end

     def create

           @industry=Industry.new(industry_params)
        if @industry.save
           flash[:alert] = "新增成功"
           redirect_to admin_industries_path
        else
           render :action =>:new
        end

     end

     def edit

     end

     def update
          if @industry.update
              flash[:alert] = "修改成功"
              redirect_to admin_industries_path
          else
              render :action => :edit
          end

     end

     def destroy
        @industry.destroy
        flash[:alert] = "刪除成功"
        redirect_to admin_industries_path

     end

     protected

     def set_industry
        @industry = Industry.find(params[:id])
     end

     def industry_params
       params.require(:industry).permit(:name)
     end

end
