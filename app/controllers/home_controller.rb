class HomeController < ApplicationController

  def index
    if params[:search_for] == "WTS"
      @search = Wts.search(params[:search])
    elsif params[:search_for] == "WTB"
      @search = Wtb.search(params[:search])
    end
  end
  
end
