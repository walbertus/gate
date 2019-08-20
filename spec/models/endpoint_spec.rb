require 'rails_helper'

describe Endpoint, type: :model do
  describe 'validations' do
    context 'when given nil path' do
      it 'should not valid' do
        endpoint = build(:endpoint, path: nil)
        expect(endpoint).not_to be_valid
      end
    end

    context 'when given nil method' do
      it 'should not valid' do
        endpoint = build(:endpoint, method: nil)
        expect(endpoint).not_to be_valid
      end
    end
  end
end
