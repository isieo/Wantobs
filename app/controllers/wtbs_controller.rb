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
    @comments = @wtb.comments
    @comment = Comment.new(user_id: current_user.id, wtb_id: @wtb.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wtb }
    end
  end
end
