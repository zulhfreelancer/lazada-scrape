class PhonesController < ApplicationController

  def index
    if params[:from].present? && params[:to].present?
      @phones = Phone.where('price >= ? AND price <= ?', params[:from].to_f, params[:to].to_f).order(price: :asc).paginate(page: params[:page], per_page: 10)
    else
      @phones = Phone.all.paginate(page: params[:page], per_page: 10).order(price: :asc)
    end
  end

end
