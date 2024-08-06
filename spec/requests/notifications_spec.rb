require 'rails_helper'

RSpec.describe 'Notifications', type: :request do
  let!(:notifications) { create_list(:notification, 5) }
  let(:valid_attributes) { { task_id: 1, user_id: 1, details: 'Test details' } }
  let(:invalid_attributes) { { task_id: nil, user_id: nil, details: nil } }

  describe 'GET /notifications' do
    it 'returns a success response' do
      get notifications_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns all notifications' do
      get notifications_path
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'POST /notifications' do
    context 'with valid params' do
      it 'creates a new Notification' do
        expect do
          post notifications_path, params: { notification: valid_attributes }
        end.to change(Notification, :count).by(1)
      end

      it 'renders a JSON response with the new notification' do
        post notifications_path, params: { notification: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['status']).to eq('Notification created successfully')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new notification' do
        post notifications_path, params: { notification: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include("Task can't be blank", "User can't be blank",
                                                               "Details can't be blank")
      end
    end
  end
end
