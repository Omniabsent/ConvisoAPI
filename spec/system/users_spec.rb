require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'User creates account' do
    it 'successfully' do
      #dando falso positivo
      post '/users', :params => { :users => {:name => 'user', :email => 'user@teste.com', :password => '123456', :password_confirmation => '123456'}}

      expect(response).to have_http_status(200)
    end

    it 'and fails to provide valid info' do
      #dando falso negativo
      post '/users', :params => { :users => {:name => 'user', :email => 'user@teste.com', :password => 'password', :password_confirmation => 'adifferentpassword'}}

      expect(response).to have_http_status(400)
    end

    # it 'and logs in' do
    # end
    #
    # it 'and can see the list of users' do
    # end
    #
    # it 'and cannot see the list of users if not logged in' do
    # end
    #
    # it 'and can see details of one user' do
    # end
    #
    # it 'and cannot see details of one user if not logged in' do
    # end
  end
end
