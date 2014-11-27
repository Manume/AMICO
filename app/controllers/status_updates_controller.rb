class StatusUpdatesController < ApplicationController
  before_action :set_status_update, only: [:show, :edit, :update, :destroy]

  # GET /status_updates
  # GET /status_updates.json

  def like
    @status_update = StatusUpdate.find(params[:id])
    @status_update.liked_by current_user
    redirect_to @status_update
  end

  def dislike
    @status_update = StatusUpdate.find(params[:id])
    @status_update.disliked_by current_user
    redirect_to @status_update
  end


  def index

    @status_updates = StatusUpdate.paginate(:page => params[:page], :per_page => 4).order("created_at desc")

    @photos = Photo.paginate(:page => params[:page], :per_page => 3).order("created_at desc")
     @status_update = StatusUpdate.new
     @posts = Post.all
     
  end

  # GET /status_updates/1
  # GET /status_updates/1.json
  def show
    @posts = Post.all
    @users = User.all
    @commentable = @status_update
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /status_updates/new
  def new
    @posts = Post.all
    @status_update = StatusUpdate.new
  end

  # GET /status_updates/1/edit
  def edit    
    @posts = Post.all
  end

  # POST /status_updates
  # POST /status_updates.json
  def create
    @posts = Post.all
    @status_update = StatusUpdate.new(status_update_params)

    respond_to do |format|
      @status_update.user_id = current_user.id if current_user
      if @status_update.save
        format.html { redirect_to status_updates_path, notice: 'Status update was successfully created.' }
        format.json { render :show, status: :created, location: @status_update }
      else
        format.html { render :new }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_updates/1
  # PATCH/PUT /status_updates/1.json
  def update
    @posts = Post.all
    respond_to do |format|
      if @status_update.update(status_update_params)
        format.html { redirect_to @status_update, notice: 'Status update was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_update }
      else
        format.html { render :edit }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_updates/1
  # DELETE /status_updates/1.json
  def destroy
    @posts = Post.all
    @status_update.destroy
    respond_to do |format|
      format.html { redirect_to status_updates_url, notice: 'Status update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_update
      @status_update = StatusUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_update_params
      params.require(:status_update).permit(:post,:user_id)
    end
end
