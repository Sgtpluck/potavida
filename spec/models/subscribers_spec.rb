require 'spec_helper'

describe Subscribers do
  describe 'validations' do
    let(:subscriber) { create(:subscriber) }

    it 'should be valid' do
      expect(subscriber).to be_valid
    end
    
    it 'should have a name' do
      subscriber.update(name: nil)

      expect(subscriber).to be_invalid
    end
    
    it 'should have an email' do
      subscriber.update(email: nil)

      expect(subscriber).to be_invalid
    end

    it 'should have a valid email' do
      subscriber.update(email: 'davida')

      expect(subscriber).to be_invalid
    end
  end
end
