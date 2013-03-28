class WtbsController < ApplicationController
  def new
    @wts = Wts.new
  end
end
