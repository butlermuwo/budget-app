require 'rails_helper'

RSpec.describe 'Category show page', type: :feature do
  before(:all) do
    @user1 = create(:user)
    @category1 = create(:category, user: @user1)
    @payment1 = create(:payment, category_id: @category1.id, user_id: @user1.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@payment1).to be_valid
    end

    it 'is not valid without a name' do
      payment = build(:payment, name: nil)
      expect(payment).to_not be_valid
    end

    it 'is not valid without an amount' do
      payment = build(:payment, amount: nil)
      expect(payment).to_not be_valid
    end
  end
end
