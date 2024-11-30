class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Post has been created'
      redirect_to @post
    else
      flash[:failure] = 'Post couldn\'t be created'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post has been updated'
      redirect_to @post
    else
      flash[:failure] = 'Post couldn\'t be updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = 'Post has been deleted'
      redirect_to posts_path
    else
      flash[:failure] = 'Post couldn\'t be deleted'
    end
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :body, :summary, :published)
  end
end
