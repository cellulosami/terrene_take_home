# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end
  # let(:id) { user.id }
  # let(:other_user) { build(:user) }
  # let(:other_user_id) { other_user.id }

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end

  # Test suite for GET /user/:id
  describe 'GET /users/:id' do
    let(:headers) { valid_headers }
    let!(:users) { create_list(:user, 2) }
    let(:user) { users.first }
    let(:id) { user.id }
    let(:other_id) { users.last.id }
  
    context 'user info is of the current user' do
      before { get "/users/#{id}", headers: headers }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the user' do
        expect(json['id']).to eq(id)
      end
    end

    context 'user info is not of the current user' do
      before { get "/users/#{other_id}", headers: headers }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Unauthorized request/)
      end
    end
  end
end