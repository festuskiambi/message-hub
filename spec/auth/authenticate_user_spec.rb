require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }
  #valid auth object
  subject(:valid_auth_object) { described_class.new(user.email, user.password) }
  #invalid auth object
  subject(:invalid_auth_object) { described_class.new('foo', 'bar') }

  describe '#call' do
    context 'when valid credentials' do
      it 'returns a token' do
        token = valid_auth_object.call
        expect(token).to_not be_nil
      end
    end

    context 'when invalid credentials' do
      it 'raises an authentication error' do
        expect { invalid_auth_object.call }.to raise_error(
          ExceptionHandler::AuthenticationError, /Invalid credentials/
        )
      end
    end
  end
end
