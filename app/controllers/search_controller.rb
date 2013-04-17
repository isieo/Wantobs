class SearchController < ApplicationController

  def search
    if !params[:search].nil?
      @search = Wts.search(params[:search])
      @search = @search + Wtb.search(params[:search])
    elsif !params[:adv_search].nil?
      if params[:search_for] == "WTB"
        @search = Wtb.search(params[:adv_search])
      else
        @search = Wts.search(params[:adv_search])
      end
    end
  end
  
end
