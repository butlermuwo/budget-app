class PaymentsController < ApplicationController
    before_action :authenticate_user!

    def index
      @category = Category.find(params[:category_id])
      @payments = Payment.where(category_id: @category.id)
      @total_amount = @payments.sum(:amount)
    end
  
    def new; end
  
    def create
      @payment = current_user.payments.new(payment_params)
      if @payment.save
        redirect_to category_payments_path(current_category), notice: 'You completed this transaction successfully'
      else
        render :new, puts: 'Something went wrong'
      end
    end
  
    def current_category
      @categories = current_user.categories.includes(:payments).find(params[:category_id])
    end
  
    private
  
    def payment_params
      params.require(:payment).permit(:name, :amount, category_ids: [])
    end
end
