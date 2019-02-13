class AttendancesController < ApplicationController

  def subscribe
    @event = Event.find(params[:id])
    if 
    @event.attendees.include? current_user
    flash[:error] = "Vous participez déjà à l'évènement"
    redirect_to @event
    end

    @amount = @event.price

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Paiement évènement',
      :currency    => 'eur'
    )
    @event.attendees << current_user
    flash[:success] = "Vous avez rejoint l'évènement"
    redirect_to @event

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event

  end
  
end
