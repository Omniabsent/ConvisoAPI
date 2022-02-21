require 'rails_helper'

RSpec.describe "Vulnerabilities", type: :request do
  describe 'User logs in' do
    it 'and can see vulnerabilities list' do

      user = User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      get '/vulnerabilities', headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).to_s).to include("Phishing")
    end


  #   it 'and can see the details of one vulnerablity' do
  #   end
  #
  #   it 'and can create new vulnerability' do
  #   end
  #
  #   it 'and can edit existing vulnerability' do
  #   end
  #
  #   it 'and cannot see vulnerabilities list if not logged in' do
  #   end
  #
  #   it 'and cannot see the details of one vulnerablity if not logged in' do
  #   end
  #
  #   it 'and cannot create new vulnerability if not logged in' do
  #   end
  #
  #   it 'and cannot edit vulnerability if not logged in' do
  #   end
  end
end
