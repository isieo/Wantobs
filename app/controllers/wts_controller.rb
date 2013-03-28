class WtsController < ApplicationController

  def index
    @wts = Wts.all
  end
  
  def new
    @wts = Wts.new
  end
  
  def create
    @wts = Wts.new
    @wts.item = params[:wts][:item]
    @wts.contactmethod = params[:wts][:contactmethod]
    @wts.information = params[:wts][:information]
    @wts.links = params[:wts][:links]
    @wts.paymentmethod = params[:wts][:paymentmethod]
    @wts.pickup = params[:wts][:pickup]
    @wts.price = params[:wts][:price]
    @wts.quantity = params[:wts][:quantity]
    @wts.used = params[:wts][:used]
    @wts.warranty = params[:wts][:warranty]
    
    #raise @wts.inspect
    
    if @wts.save
      redirect_to wts_path(@wts.slug), notice: 'Your WTS is created'
    else
      render action: "new"
    end

    #flash[:notice] = "Your WTS is created"
    #redirect_to wts_index_path
  end
  
  def show
    @wts = Wts.where(slug: params[:id])
    @wts = Wts.find(params[:id]) if @wts.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wts }
    end
  end
end
