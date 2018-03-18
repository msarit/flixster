class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.enrollments.create(course: current_course)
    redirect_to course_path(current_course)
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
