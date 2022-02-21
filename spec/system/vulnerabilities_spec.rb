require 'rails_helper'

RSpec.describe "Vulnerabilities", type: :request do
  describe 'User logs in' do
    it 'and can see vulnerabilities list' do
      user = User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      get '/vulnerabilities', headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(response.body).to include("Phishing")
    end

    it 'and can create new vulnerability' do
      user = User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      post '/vulnerabilities', :params => { :vulnerability => {:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified'}}, headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(response.body).to include("Phishing")
    end

    it 'and can delete existing vulnerability' do
      user = User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      delete "/vulnerabilities/#{vulnerability.id}", headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(response.body).to_not include("Phishing")
      expect(response.body).to include("Vulnerabilidade excluída, log de alteração gerado em change_history")
    end

    it 'and cannot see vulnerabilities list if not logged in' do
      Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      get '/vulnerabilities'

      expect(response).to have_http_status(401)
      expect(response.body).to_not include("Phishing")
      expect(response.body).to include("Please log in")
    end

    it 'and cannot create new vulnerability if not logged in' do
      post '/vulnerabilities', :params => { :vulnerability => {:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified'}}

      expect(response).to have_http_status(401)
      expect(response.body).to_not include("Phishing")
      expect(response.body).to include("Please log in")
    end

    it 'and cannot delete vulnerability if not logged in' do
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      delete "/vulnerabilities/#{vulnerability.id}"

      expect(response).to have_http_status(401)
      expect(response.body).to_not include("Phishing")
      expect(response.body).to_not include("Vulnerabilidade excluída, log de alteração gerado em change_history")
      expect(response.body).to include("Please log in")
    end
  end
end
