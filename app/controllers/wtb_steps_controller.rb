class WtbStepsController < ApplicationController
  include Wicked::Wizard
  before_filter :init_wtb
  steps :images
  
  def show
    @wtb.wtb_images.build if @wtb.wtb_images.blank?
    render_wizard
  end
  
  def update
    @wtb.attributes = params[:wtb]
    @wtb.save
    render_wizard @wtb
  end
  
  def init_wtb
    @wtb = Wtb.where(slug: params[:wtb_id]).first
    @wtb = Wtb.find(params[:wtb_id]) if @wtb.nil?
  end
  
  private
  
  def finish_wizard_path
    flash[:notice] = "Images for your WTB is updated"
    wtb_path(@wtb.slug)
  end
  
end
