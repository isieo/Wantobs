class WtbsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  #before_filter :authenticate_user!, :only => [:edit, :update, :new, :create, :destroy]
  def index
    @wtbs = Wtb.all
  end

  def new
    @wtb = Wtb.new
  end

  def create
    @wtb = current_user.wtbs.new(params[:wtb])

    if @wtb.save
      redirect_to wtb_wtb_steps_path(@wtb.slug), notice: "Your WTB is created."
    else
      render action: "new"
    end

  end

  def edit
    @wtb = Wtb.where(slug: params[:id]).first
    @wtb = Wtb.find(params[:id]) if @wtb.nil?
  end

  def update
    @wtb = Wtb.where(slug: params[:id]).first
    @wtb = Wtb.find(params[:id]) if @wtb.nil?

    @wtb.update_attributes(params[:wtb])

    if @wtb.save
      redirect_to wtb_wtb_steps_path(@wtb.slug, :id => "images")
    else
      render action: "new"
    end

  end

  def show
    @wtb = Wtb.where(slug: params[:id]).first
    @wtb = Wtb.find(params[:id]) if @wtb.nil?
    @commentable = @wtb
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wtb }
    end
  end
  
  def destroy
    @wtb = Wtb.find(params[:id])
    @wtb.destroy
    redirect_to user_path(@wtb.user), notice: "Your WTB is deleted."
  end
end
