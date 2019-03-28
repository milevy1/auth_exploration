require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  describe 'As a visitor to the new user form' do
    describe 'When I fill out a form with my information' do
      it 'should add that user to the database' do
        visit new_user_path

        fill_in "Name", with: "User1"
        fill_in "Email", with: "user1@email.com"
        fill_in "Password", with: "user1_password"
        click_on "Register"

        user = User.first

        expect(user.name).to eq("User1")
        expect(user.email).to eq("user1@email.com")
        expect(user.password).to eq("user1_password")
      end
    end
  end
end
