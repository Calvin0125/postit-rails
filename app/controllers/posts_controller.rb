class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  helper_method :belongs_to_user

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    if @post.belongs_to_user(session[:user_id])
      render :edit
    else 
      flash[:alert] = "You must be the creator of "\
                      "the post to do that."
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
