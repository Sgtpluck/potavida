require 'spec_helper'

describe Post do
  describe 'validations' do
    let!(:post) { create(:post) }
    it 'should be successful' do

      expect(post).to be_valid
    end

    it 'should have a title' do
      post.update(title: nil)

      expect(post).to be_invalid
    end

    it 'should have a date' do
      post.update(date: nil)

      expect(post).to be_invalid
    end

    it 'should have content' do
      post.update(content: nil)

      expect(post).to be_invalid
    end

    it 'should have a snippet' do
      post.update(snippet: nil)

      expect(post).to be_invalid
    end
  end
end
