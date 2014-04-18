require 'spec_helper'

describe User do
  let!(:user) { create(:user) }
  describe 'validations' do
    it 'should be valid' do
      expect(user).to be_valid
    end

    it 'should have a name' do
      user.name = nil

      expect(user).to be_invalid
    end

    it 'should have a unique name' do
      user1 = build(:user1)

      expect(user1).to be_invalid
    end

    it 'should have an email address' do
      user.email = nil

      expect(user).to be_invalid
    end

    it 'should have a unique email address' do
      user1 = build(:user1)

      expect(user1).to be_invalid
    end

    it 'should have a real email address' do
      user.email = 'davida'

      expect(user).to be_invalid
    end

    it 'should have a password' do
      user.password_digest = nil

      expect(user).to be_invalid
    end
  end

  describe 'update roles' do
    it 'should update the user role' do
      user2 = create(:user_manager)
      user2.update_roles({role: 'admin'})

      expect(user2.role).to eq 'admin'
    end
  end
end
