class WtbStepsController < ApplicationController
  include Wicked::Wizard
  steps :images
  
  def show
    @wtb = Wtb.where(slug: params[:wtb_id]).first
    @wtb = Wtb.find(params[:wtb_id]) if @wtb.nil?
    render_wizard
  end
  
  def update
    @wtb = Wtb.where(slug: params[:wtb][:wtb_id]).first
    @wtb = Wtb.find(params[:wtb][:wtb_id]) if @wtb.nil?

    @wtb.image = params[:wtb][:image]
    
    if @wtb.save
      redirect_to wtb_path(@wtb.slug), notice: 'Your WTB is created'
    else
      render action: "new"
    end

  end
end
