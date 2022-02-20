class VulnerabilitiesController < ApplicationController
  def index
    @vulnerabilities = Vulnerability.all
    render json: @vulnerabilities
  end

  def create
    @vulnerability = Vulnerability.new(vulnerability_params)
    if @vulnerability.save
      vulnerability_id = @vulnerability.id
      vulnerability_status = @vulnerability.status
      user_id = @user.id
      ChangeHistory.create! (params = {:user_id => user_id,  :vulnerability_id => vulnerability_id, :vulnerability_status => vulnerability_status})
      render json: @vulnerability
    else
      render error: { error: 'Não foi possível criar a vulnerabilidade'}, status: 400
    end
  end

  # def update
  #   if @vulnerability
  #     @vulnerability.update(vulnerability_params)
  #     ChangeHistory.create!(:user_id, :vulnerability_id)
  #     render json: { message: 'Vulnerabilidade atualizada'}, status: 200
  #   else
  #     render json: { error: 'Não foi possível atualizar a vulnerabilidade'}, status: 400
  #   end
  # end

    private

  def vulnerability_params
    params.require(:vulnerability).permit(:name, :description, :impact_level, :solution, :status)
  end
end
