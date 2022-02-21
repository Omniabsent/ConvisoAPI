require 'rails_helper'

RSpec.describe "Users:", type: :request do
  describe 'User creates account' do
    it 'successfully' do
      post '/sign_up', :params => {:name => 'user', :email => 'user@teste.com', :password => 'password'}

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include("token")

    end

    it 'using an username already taken' do
      User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      post '/sign_up', :params => {:name => 'user', :email => 'user@teste.com', :password => 'password'}

      expect(response).to have_http_status(400)
      expect(JSON.parse(response.body)).to eq("error" => "Username or email alredy in use")
    end

    it 'and logs in' do
      User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      post '/login', :params => {:name => 'user', :email => 'user@teste.com', :password => 'password'}

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include("token")
    end

    it 'and tries to log in with the wrong password' do
      User.create!(name: 'user', :email => 'user@teste.com', password: 'password')
      post '/login', :params => {:name => 'user', :email => 'user@teste.com', :password => 'wrong_password'}

      expect(response).to have_http_status(400)
      expect(JSON.parse(response.body)).to eq("error" => "Invalid username or password")
    end
  end
end
