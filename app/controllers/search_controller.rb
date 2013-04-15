class SearchController < ApplicationController

  def search
    @search = Wts.search(params[:search])
    @search = @search + Wtb.search(params[:search])
  end
  
end
