class LovesController < ApplicationController
before_action :find_post
  def create
  	 if already_loved?
  	   flash[:notice] = "You can't love more than once"
  	 else
      @post.love_reactions.create(user_id: current_user.id)
     end
      redirect_to post_path(@post)
  end

  private

  def already_loved?
  LoveReaction.where(user_id: current_user.id, post_id:
  params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
