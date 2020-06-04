class PostsController < ApplicationController

	def index
      @posts=Post.all
	end
    
    def show
      @post= Post.find(params[:id])
    end
    
    def update
      @post= Post.find(params[:id])

      if(@post.update(post_params))
      	redirect_to  posts_path
      else
      	render 'edit'
      end
    end

    def destroy
       @post= Post.find(params[:id])
       @post.destroy

       redirect_to posts_path
    end 
     

    def new 
    	@post =Post.new
    end

    def edit
     @post= Post.find(params[:id])

    end

    def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
        if @post.save
            flash[:notice] = 'Post was successfully created.'
            format.html { redirect_to post_path(@post) }
        else
            flash[:notice] = 'Something went wrong.'
            format.html { render :action => "new" }
            # or
            # format.html { redirect_to new_post_path }
        end
     end
    end

    private def post_params
      params.require(:post).permit(:title,:body)
    end 


end
