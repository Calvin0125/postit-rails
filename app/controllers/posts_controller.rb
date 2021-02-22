class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    params[:post][:user_id] = 1
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    params[:post][:user_id] = 1
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
