class PostsController < ApplicationController
	#before_action :logged_in_user, only: :index
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new
    if @post.save(post_params)
      redirect_to post_path
    else
      render 'new'
    end
  end

  def index
  	@posts = Post.paginate(page: params[:page])
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end

end
