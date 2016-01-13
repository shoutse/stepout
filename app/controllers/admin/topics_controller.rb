class Admin::TopicsController < ApplicationController
   before_action :authenticate_user!
   before_action :check_admin
   before_action :set_topic, :only =>[:show, :update, :edit, :destroy]

  layout "admin"

     def show

     end

     def index
       @industries = Industry.all
       @topics = Topic.all


     end

     def new
        @topic = Topic.new
     end

     def create
        @topic = Topic.new(topic_params)
        @topic=current_user.topic
        if @topic.save
          flash[:notice] = "新增成功"
          redirect_to admin_topics_path
        else
          render :action => :new
        end

     end

     def edit

     end

     def update
        if @topic.update(topic_params)
          flash[:notice] = "編輯成功"
          redirect_to admins_topic_path
        else
          render :action => :edit
        end
     end

     def destroy
      @topic.destroy
      flash[:alert] = "刪除成功"
      redirect_to admin_topics_path

     end

    protected

    def check_admin
      unless current_user.admin?
        raise AvtiveRecord::RecordNotFound
      end
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end


  # def authenticate
     # authenticate_or_request_with_http_basic do |user_name, password|
       # user_name == "username" && password == "password"
     # end
  # end



end
