class ChangeHistoriesController < ApplicationController

  def index
    @change_histories = ChangeHistory.all
    render json: @change_histories
  end

  def show
    id = params[:id]
    @change_history = ChangeHistory.find(id)
    render json: {"Vulnerability name": @change_history.vulnerability.name, "Vulnerability status": @change_history.vulnerability_status, "Modified at": @change_history.updated_at, "By the user": @change_history.user.name }
  end

  def create
    @change_history = ChangeHistory.new(params)
    @change_history.save
  end

end
