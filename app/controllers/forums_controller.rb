class ForumsController < ApplicationController
	before_action :find_forum, only: [:show, :edit, :update, :destroy]

	def index
		@forums = Forum.all
  		if params[:search]
    		@forums = Forum.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 4)
  		else
    		@forums = Forum.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
  		end
	end

	def new
		@forum = Forum.new
	end

	def create
		@forum = Forum.new forum_params
		if @forum.save
			redirect_to @forum, notice: "Your article was successfully saved!"
		else
			render 'new', notice: "Failed to save"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @forum.update forum_params
			redirect_to @forum, notice: "Forum successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@forum.destroy
		redirect_to forums_path
	end

	private
	def find_forum
		@forum = Forum.friendly.find(params[:id])
	end

	def forum_params
		params.require(:forum).permit(:title, :content, :slug)
	end
end
