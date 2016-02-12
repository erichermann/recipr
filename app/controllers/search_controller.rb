class SearchController < ApplicationController
  before_filter :set_params
  respond_to :html, :js

  def index
    @search_results = Recipe.where('title LIKE ?', "%#{params[:search]}%").paginate(per_page: PAGINATION_PER_PAGE, page: params[:page])
  end

  private

  def set_params
    params.permit!
  end
end
