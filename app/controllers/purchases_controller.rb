class PurchasesController < ApplicationController
  # POST /purchases
  def create
    @purchase = Purchase.where(purchase_params).first_or_initialize
    @purchase.from_date = Time.now

    http_status = @purchase.new_record? ? :created : :ok

    if @purchase.save
      render json: @purchase, status: http_status
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params.require(:purchase).permit(:user_id, :purchase_option_id).merge(content_id: content_id)
    end

    def content_id
      params.require(:content_id)
    end
end
