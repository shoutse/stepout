class Admin::DraftsController < ApplicationController

  # [CR] consider to extract the AdminController
  # put same behaviors to it (like: check_admin, assign layout)

  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_draft, :only=>[:show, :edit, :update, :destroy]
layout "admin"
     def index
      @drafts = Draft.all
     end

    def show
      #   if params[:draft_id]
      # @draft = Draft.find(:draft_id)

    end

    def new
     @draft = Draft.new
    end

    def create
      @draft = current_user.drafts.new(draft_params)

      if current_user.role == "admin"
        @draft.status= "小編"
      end

      if @draft.save
        redirect_to admin_topics_path
      else
        render :new
      end
    end

   def draft_upload
    ids = Array( params[:ids] )
    drafts = Draft.where(id: ids)

    if params[:commit] == "核選刪除"

      drafts.each { |d| d.destroy }
      flash[:alert] = "刪除成功"
      redirect_to admin_topics_path

     elsif params[:commit] == "核選發佈"
       drafts.each do |d|

        @topic = Topic.copy_from_draft(d)
        @topic.save!
       
        d.status = "已發佈" # published
        d.save!

        flash[:notice] = "上傳成功"
      end

      redirect_to admin_topics_path
     end
    end

         def edit

         end

         def update
          if @draft.update(draft_params)
            flash[:alert]="新增成功"
            redirect_to admin_topics_path
          else
            render :action => :edit

          end
        end

        def destroy
          @draft.destroy
          flash[:alert] = "刪除成功"
          redirect_to admin_topics_path

        end

        protected

        def set_draft

         @draft = Draft.find(params[:id])
       end


      def draft_params
        params.require(:draft).permit(:name, :privacy, :istrue, :content, :answer1, :answer2, :industry_id, :position_id, :working_time, :duration, :user_id, :bootsy_image_gallery_id)
      end

    end
