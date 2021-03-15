class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment was successfully created"
      redirect_to post_path(@post)
    else
      # Deletion is necessary, otherwise the comments partial tries to
      # render the in-memory comment and throws an error
      @post.comments.delete(@comment)
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    vote = Vote.new(vote: params[:vote], user_id: current_user.id, voteable: @comment)
    if vote.save
      flash.now[:notice] = "Your vote on the comment has been counted."
    else
      flash.now[:error] = "You can't vote on a comment more than once."
    end
    @resource = @comment
    respond_to do |format|
      format.js { render 'posts/vote' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end