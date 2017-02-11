class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
  		if params[:search]
    		@posts = Post.search(params[:search]).order("created_at DESC")
  		else
    		@posts = Post.all.order('created_at DESC')
  		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		if @post.save
			redirect_to @post, notice: "Your article was successfully saved!"
		else
			render 'new', notice: "Failed to save"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Post successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
	def find_post
		@post = Post.friendly.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :slug)
	end

end
