require 'rails_helper'

RSpec.describe "ChangeHistories", type: :request do
  describe 'User logs in' do
    it 'and can see the change history list' do
      user = User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      change_history = ChangeHistory.create!(:user_id => user.id,  :vulnerability_id => vulnerability.id, :vulnerability_status => vulnerability.status)
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      get '/change_histories', headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(response.body).to include("identified")
    end

    it 'and can see the details of a change log from an existing vulnerability' do
      user = User.create!(name: 'Fulano', :email => 'user@teste.com', password: 'password')
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      change_history = ChangeHistory.create!(:user_id => user.id,  :vulnerability_id => vulnerability.id, :vulnerability_status => vulnerability.status)
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      get "/change_histories/#{change_history.id}", headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(response.body).to include("Phishing")
      expect(response.body).to include("Fulano")
    end

    it 'and can see the details of a change log from a deleted vulnerability' do
      user = User.create!(name: 'Fulano', :email => 'user@teste.com', password: 'password')
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      change_history = ChangeHistory.create!(:user_id => user.id,  :vulnerability_id => vulnerability.id, :vulnerability_status => vulnerability.status)
      token = JWT.encode({user_id: user.id}, 's3cr3t')
      delete "/vulnerabilities/#{vulnerability.id}", headers: {Authorization: "Bearer #{token}"}
      get "/change_histories/#{change_history.id+1}", headers: {Authorization: "Bearer #{token}"}

      expect(response).to have_http_status(200)
      expect(response.body).to include("Phishing")
      expect(response.body).to include("Fulano")
      expect(response.body).to include("deleted")
    end

    it 'and cannot see change history list if not logged in' do
      user = User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      change_history = ChangeHistory.create!(:user_id => user.id,  :vulnerability_id => vulnerability.id, :vulnerability_status => vulnerability.status)
      get '/change_histories'

      expect(response).to have_http_status(401)
      expect(response.body).to include("Please log in")
    end

    it 'and cannot see change history details if not logged in' do
      user = User.create!(name: 'Fulano', :email => 'user@teste.com', password: 'password')
      vulnerability = Vulnerability.create!(:name => 'Phishing', :description => 'bait', :impact_level => 'high', :solution => 'don\'t fall for bait', :status => 'identified' )
      change_history = ChangeHistory.create!(:user_id => user.id,  :vulnerability_id => vulnerability.id, :vulnerability_status => vulnerability.status)
      get "/change_histories/#{change_history.id}"

      expect(response).to have_http_status(401)
      expect(response.body).to_not include("Phishing")
      expect(response.body).to_not include("Fulano")
      expect(response.body).to include("Please log in")
    end
  end
end
