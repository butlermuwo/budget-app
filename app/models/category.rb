class Category < ApplicationRecord
    belongs_to :user
    has_many :category_payments
    has_many :payments, through: :category_payments
    has_one_attached :icon
  
    validates :name, presence: true, length: { maximum: 250 }
  
    def recent_categories
      categories.order(created_at: :DESC)
    end
  
    def recent_payments
      payments.order(created_at: :DESC)
    end
end
