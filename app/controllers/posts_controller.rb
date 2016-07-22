class PostsController < ApplicationController
	before_action :authenticate_user!
  
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(strong_params)
  	if @post.save
  		flash[:success] = "Post saved!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  private

  def strong_params
  	params.require(:post).permit(:image, :description)
  end


end
