require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  let!(:messages) { create_list(:message, 10) }
  let(:message_id) { messages.first.id }

  describe 'GET /messages' do
    before { get '/messages' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns messages' do
      expect(json).not_to be_empty
      expect(json.size).to eq 10
    end
  end

  describe 'POST /messages' do
    let(:valid_attributes) {
      { originator: 'Festus kiambi',
        recipient: 'John Doe',
        content: 'how are you doing',
        status: 1 }
    }
    context 'with valid attibutes' do
      before { post '/messages', params: valid_attributes }

      it 'creates a message' do
        expect(json).not_to be_empty
        expect(json['originator']).to eq 'Festus kiambi'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when message does not exists' do
      before { post '/messages', params: { originator: 'Festus kiambi' } }

      it 'returns validation failed message' do
        expect(response.body).to match(/can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /messages/:id' do
    before { delete "/messages/#{message_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
