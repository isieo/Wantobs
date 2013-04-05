class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      flash[:notice] = "Comment successfully created"
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
end
