class Admin::DraftsController < ApplicationController
     before_action :authenticate_user!
     before_action :check_admin
     before_action :set_draft, :only=>[:show, :edit, :update, :destroy]

     def index
        @drafts = Draft.all
     end

     def show

     end


     def edit

     end

     def update
        if @draft.update(draft_params)
          flash[:alert]="新增成功"
          redirect_to admin_drafts_path
        else
          render :action => :edit

         end
     end

     def destroy
        @draft.destroy
        flash[:alert] = "刪除成功"
        redirect_to admin_drafts_path

     end

     protected

     def set_draft

       @draft = Draft.find(params[:id])
     end

     def check_admin
       unless current_user.admin?
        raise AvtiveRecord::RecordNotFound
       end
     end

     def draft_params
        params.require(:draft).permit(:name,:content,:answer1,:answer2,:industry_id,:position_id)
     end

end
