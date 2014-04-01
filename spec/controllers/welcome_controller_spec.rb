require 'spec_helper'

describe WelcomeController do
  describe 'get "index"' do
    it "should be successful" do
      get 'index'

      expect(response).to be_successful
    end
  end
end