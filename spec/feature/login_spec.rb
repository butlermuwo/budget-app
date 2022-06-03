require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:all) do
    @user = FactoryBot.create(:user)
  end

  before(:each) do
    visit(new_user_session_path)
  end

  context 'Test login page' do
    it 'should have a login form' do
      expect(page).to have_selector('form')
    end

    it 'should have a login field' do
      expect(page).to have_selector('input[name="user[email]"]')
    end

    it 'should have a password field' do
      expect(page).to have_selector('input[name="user[password]"]')
    end

    it 'should have a login button' do
      expect(page).to have_selector('input[type="submit"]')
    end
  end
end
