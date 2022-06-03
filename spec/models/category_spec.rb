require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @user1 = create(:user)
    @category1 = create(:category, user: @user1)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@category1).to be_valid
    end

    it 'is not valid without a name' do
      category = build(:category, name: nil)
      expect(category).to_not be_valid
    end

    it 'is not valid without a user' do
      category = build(:category, user: nil)
      expect(category).to_not be_valid
    end
  end
end
