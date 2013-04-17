class WtsStepsController < ApplicationController
  include Wicked::Wizard
  before_filter :init_wts
  steps :images
  
  def show
    @wts.wts_images.build if @wts.wts_images.blank?
    render_wizard
  end
  
  def update
    @wts.update_attributes(params[:wts])
    @wts.save
    render_wizard @wts
  end
  
  def init_wts
    @wts = Wts.where(slug: params[:wts_id]).first
    @wts = Wts.find(params[:wts_id]) if @wts.nil?
  end
  
  private
  
  def finish_wizard_path
    flash[:notice] = "Images for your WTS is updated"
    wts_path(@wts.slug)
  end
  
end
