class GasController < ApplicationController
  before_action :reload_price

  def index
    prices = Gas.order(state: :asc).to_json({ only: [:state, :price] })
    render json: prices, status: 200
  end

  def show
    state = Gas.find_by(state: params[:state].upcase).to_json({ only: [:state, :price] })
    if state
      render json: state, status: 200
    else
      render json: "state does not exist", status: 422
    end
  end

private
  
  def reload_price
    Gas.update_price!
  end

  def gas_params
    params.permit(:state)
  end
end
