class WtsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  #before_filter :authenticate_user!, :only => [:edit, :update, :new, :create, :destroy]
  def index
    @wts = Wts.all
  end
  
  def new
    @wts = Wts.new
  end

  def create
    @wts = current_user.wts.new(params[:wts])
    
    if @wts.save
      redirect_to wts_wts_steps_path(@wts.slug), notice: "Your WTS is created."
    else
      render action: "new"
    end

  end
  
  def edit
    @wts = Wts.where(slug: params[:id]).first
    @wts = Wts.find(params[:id]) if @wts.nil?
  end
  
  def update
    @wts = Wts.where(slug: params[:id]).first
    @wts = Wts.find(params[:id]) if @wts.nil?

    @wts.update_attributes(params[:wts])
    
    if @wts.save
      redirect_to wts_wts_steps_path(@wts.slug, :id => "images")
    else
      render action: "new"
    end

  end
  
  def show
    @wts = Wts.where(slug: params[:id]).first
    @wts = Wts.find(params[:id]) if @wts.nil?
    @commentable = @wts
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wts }
    end
  end
  
  def destroy
    @wts = Wts.find(params[:id])
    @wts.destroy
    redirect_to user_path(@wts.user), notice: "Your WTS is deleted."
  end
end
