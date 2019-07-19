class SearchController < ApplicationController
  def index
    render locals: {
      facade: HouseSearchFacade.new(params[:house])
    }
  end
end
