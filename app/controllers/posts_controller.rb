class PostsController < ApplicationController
  include SessionsHelper

  before_action :check_logged, except: [:index]

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
    current_user!
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    
    if @post.save
      flash[:success] = "Post published!"
      redirect_to root_path
    elsif
      render :new
    end
  end

  private
  def check_logged
    unless logged_in?
      flash[:allert] = "Must be logged in to publish posts"
      redirect_to signin_path 
    end
  end
  
  def check_if_member
    user = current_user
    unless user.member
      flash[:allert] = "Must be member to publish posts"
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:body, :title)
  end
end
