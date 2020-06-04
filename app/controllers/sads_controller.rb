class SadsController < ApplicationController
before_action :find_post
  def create
  	if already_saded?
      flash[:notice] = "You can't react sad more than once "

  	else
      @post.sads.create(user_id: current_user.id)
    end
      redirect_to post_path(@post)
  end



  private

  def already_saded?
    Sad.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
