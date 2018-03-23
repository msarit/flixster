class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create

    if current_course.premium?
     # Amount in cents
    @amount = (current_course.cost * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Now You Cook content',
      currency: 'usd'
    )
    end

    current_user.enrollments.create(course: current_course)
    redirect_to course_path(current_course)
    
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  private

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def enroll_params
    params.require(:enrollment).permit(:course_id, :user_id)
  end

end
