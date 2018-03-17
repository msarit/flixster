class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course

  def new
    @section = Section.new
  end

  def create
    @section = current_course.sections.create(section_params)
    redirect_to instructor_course_path(current_course)
  end

  private

  def require_authorized_for_current_course
  if current_course.user != current_user
      return render plain: 'Unauthorized!', status: :unauthorized
    end
end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

  def section_params
    params.require(:section).permit(:title)
  end

end
