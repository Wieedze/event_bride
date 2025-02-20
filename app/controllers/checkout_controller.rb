class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @event_id = params[:event_id]
    @session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      line_items: [
        {
          price_data: {
            currency: "eur",
            unit_amount: (@total*100).to_i,
            product_data: {
              name: "Rails Stripe Checkout"
            }
          },
          quantity: 1
        },
      ],
      mode: "payment",
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      metadata: {
        event_id: @event_id, user_id: @user_id
      }
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @event_id = @session.metadata.event_id

    if @payment_intent.status == "succeeded"

      @attendance = Attendance.create(user_id: current_user.id, event_id: @event_id)
      # @attendance.user = current_user
      # @attendance.event_id = @event_id
      flash[:notice] = "you are going to party"
      puts current_user.id
      puts @event_id
      puts @attendance
      puts "#"*60
    else
      flash[:alert] = "la reservation ne cest pas faite . Essayez à nouveau."

    end
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @event_id = @session.metadata.event_id
  end
end
