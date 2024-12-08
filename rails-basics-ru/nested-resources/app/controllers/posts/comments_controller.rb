# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_post, only: %i[edit create update destroy]

  def create
    @comment = @post.post_comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was added'
    else
      redirect_to post_path(@post), status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      redirect_to post_path(@post), notice: 'Comment was deleted'
    else
      flash[:failure] = "Comment couldn't be deleted"
    end
  end

  private

  def set_comment
    @comment = PostComment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:post_id, :body)
  end
end
