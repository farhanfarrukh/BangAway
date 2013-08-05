class PostsController < ApplicationController

	http_basic_authenticate_with name: "farhan", password: "yahoo", except: [:index, :show]

	def index
  		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
  		@post = Post.new(params[:post].permit(:title, :text))
	 
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
	 
	def show
  		@post = Post.find(params[:id])
	end

	def edit
  		@post = Post.find(params[:id])
  		if @post.update(params[:post])
	    	redirect_to @post
	 	else
	    	render 'edit'
  		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

end
