require 'rails_helper'

RSpec.describe "Vulnerabilities", type: :request do
  describe 'User logs in' do
    it 'and can see vulnerabilities list' do
      User.create!(name: 'user', :email => 'user@teste.com', password: '123123')

    #  , as: :json, headers: {:Authorization => "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE"}

      expect(response).to have_http_status(200)
      #expect(JSON.parse(response.body)).to include("token")
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
