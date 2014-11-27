class CommentsController < ApplicationController
  
	before_filter :load_commentable
  def index
  	#@commentable = Article.find(params[:article_id])
  	@comments = @commentable.comments
    
  end

  def new
  	@comment = @commentable.comments.new
  end
  def create
  	@comment = @commentable.comments.new(comment_params)
  	@comment.user_id = current_user.id if current_user
  	if @comment.save
  		redirect_to @commentable,notice: "Comment created"
  	else
  		render :new
  	end
  end

   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    if @comment.destroy
      redirect_to @commentable, notice: "Comment deleted."
    end
  end
  def edit
  	@comment = Comment.find(params[:id])
  end
  def show
  	@comment = Comment.find(params[:id])
  end
  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(comment_params)
  		redirect_to @commentable,notice: "Comment updated"
  	end
  end

  private
  def load_commentable
  	resourse,id = request.path.split('/')[1,2]
  	 @commentable = resourse.singularize.classify.constantize.find(id)
  end
  def comment_params
  	params.require(:comment).permit(:content,:user_id)
  end
end
