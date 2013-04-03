class WtbStepsController < ApplicationController
  include Wicked::Wizard
  before_filter :init_wtb
  steps :images
  
  def show
    render_wizard
  end
  
  def update
    @wtb.image = params[:wtb][:image]
    
    if @wtb.save
      redirect_to wtb_path(@wtb.slug), notice: 'Your WTB is created'
    else
      render action: "new"
    end
  end
  
  def init_wtb
    @wtb = Wtb.where(slug: params[:wtb_id]).first
    @wtb = Wtb.find(params[:wtb_id]) if @wtb.nil?
  end
end
