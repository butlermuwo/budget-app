class Payment < ApplicationRecord
    belongs_to :user
  has_many :category_payments
  has_many :categories, through: :category_payments

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  def total_price
    payments.sum('amount')
  end
end
