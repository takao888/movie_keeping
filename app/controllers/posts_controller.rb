class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :redirect_root, except: :index

  def index
    @post = Post.order("created_at DESC")

  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:image, :content, :country, :supervision, :title).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
