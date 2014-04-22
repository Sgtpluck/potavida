require 'spec_helper'

describe Press do
  describe 'validations' do
    let!(:press) { create(:press) }
    it 'should be successful' do

      expect(press).to be_valid
    end

    it 'should have a title' do
      press.update(title: nil)

      expect(press).to be_invalid
    end

    it 'should have a url' do
      press.update(url: nil)

      expect(press).to be_invalid
    end

    it 'should have a pubdate' do
      press.update(pubdate: nil)

      expect(press).to be_invalid
    end

    it 'should have a valid date' do
      press.update(pubdate: 'hello')

      expect(press).to be_invalid
    end
  end
end
