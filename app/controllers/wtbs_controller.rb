class WtbsController < ApplicationController

  def index
    @wtbs = Wtb.all
  end
  
  def new
    @wtb = Wtb.new
  end

  def create
    @wtb = current_user.wtbs.new
    @wtb.item = params[:wtb][:item]
    @wtb.contactmethod = params[:wtb][:contactmethod]
    @wtb.additional_info = params[:wtb][:additional_info]
    @wtb.links = params[:wtb][:links]
    @wtb.paymentmethod = params[:wtb][:paymentmethod]
    @wtb.pickup = params[:wtb][:pickup]
    @wtb.price = params[:wtb][:price]
    @wtb.quantity = params[:wtb][:quantity]
    @wtb.used = params[:wtb][:used]
    @wtb.warranty = params[:wtb][:warranty]
    
    if @wtb.save
      redirect_to wtb_path(@wtb.slug), notice: 'Your wtb is created'
    else
      render action: "new"
    end

  end
  
  def show
    @wtb = Wtb.where(slug: params[:id]).first
    @wtb = Wtb.find(params[:id]).first if @wtb.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wtb }
    end
  end
end
