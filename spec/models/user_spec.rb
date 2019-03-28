require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }

    it { should validate_uniqueness_of :name }
    it { should validate_uniqueness_of :email }
  end

  describe 'Class Methods' do
    describe '.authenticate(email, password)' do
      before :each do
        @name = 'User1'
        @email = 'user1@email.com'
        @password = 'user1password'

        @user = User.create(name: @username, email: @email, password: @password)
      end

      it 'returns a User if email and password correspond to a valid user' do
        expect(User.authenticate(@email, @password)).to eq(@user)
      end

      it 'returns nil if the email and password do not correspond to a valid user' do
        invalid_1 = User.authenticate('Invalid@email.com', 'invalid_password')
        invalid_2 = User.authenticate(@email, 'invalid_password')
        invalid_3 = User.authenticate('Invalid@email.com', @password)

        expect(invalid_1).to eq(nil)
        expect(invalid_2).to eq(nil)
        expect(invalid_3).to eq(nil)
      end
    end
  end
end
