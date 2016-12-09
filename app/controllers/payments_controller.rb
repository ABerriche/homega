class PaymentsController < ApplicationController

  def create
  @place = Place.find(params[:id])
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       130, # or amount_pennies
    description:  "Souscription Homega",
    currency:     :eur
  )

  redirect_to finalization_path(@place)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

end



