class ChangeHistoriesController < ApplicationController
  before_action :authenticate_user!

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
    @change_history = ChangeHistory.new(change_history_params)
    @change_history.save
  end

  private

  def change_history_params
    params.require(:change_history).permit(:user_id, :vulnerability_id, :status)
  end
end
