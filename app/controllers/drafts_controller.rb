class DraftsController < ApplicationController
	def index
		
	end

	def new
		@draft=Draft.new
		
	end

	def create
		@draft=Draft.new(draft_params)
		@draft.user=current_user
		@draft.status="未審理"
		if @draft.save
			flash[:notice] = "投稿成功!!"
			redirect_to welcome_path
		else
			render new_draft_path		
		end
		
	end

	def show
		
	end

	protected

	def draft_params
		params.require(:draft).permit(:name,:content,:istrue,:privacy,:industry_id,:position_id,:working_time,:answer1)
		
	end


end
