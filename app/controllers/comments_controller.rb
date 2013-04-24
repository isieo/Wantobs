class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end
  
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      UserMailer.comment_notification(@comment).deliver
      redirect_to @commentable, notice: "Comment created."
    else
      flash[:notice] = "There is an error posting your comment, please try again later"
    end
  end
  
  def edit
    @comment = Comment.where(slug: params[:id]).first
    @comment = Comment.find(params[:id]) if @comment.nil?

  end
  
  def update
    @comment = Comment.where(slug: params[:id]).first
    @comment = Comment.find(params[:id]) if @comment.nil?

    @comment.update_attributes(params[:comment])
    
    if @comment.save
      flash[:notice] = "Comment successfully edited"
    else
      flash[:notice] = "There is an error updating your comment, please try again later"
    end

  end
  
  def show
    @comment = Comment.where(slug: params[:id]).first
    @comment = Comment.find(params[:id]) if @comment.nil?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end
  
  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
