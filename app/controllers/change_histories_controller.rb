class ChangeHistoriesController < ApplicationController
  #before_action :authenticate_user!

  def index
    @change_histories = ChangeHistory.all
    render json: @change_histories
  end

  def show
    id = params[:id]
    @change_history = ChangeHistory.find(id)
    render json: @change_history
  end

  def create
    @change_history = ChangeHistory.new(params)
    @change_history.save
  end

end
