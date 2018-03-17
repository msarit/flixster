class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

def new
  @lesson = Lesson.new
end

def create
  @lesson = current_section.lessons.create(lesson_params)
  redirect_to instructor_course_path(current_section.course)
end

private

def require_authorized_for_current_section
  if current_section.course.user != current_user
      return render plain: 'Unauthorized!', status: :unauthorized
    end
end

def lesson_params
  params.require(:lesson).permit(:title, :subtitle)
end

helper_method :current_section
def current_section
  @current_section ||= Section.find(params[:section_id])
end

end
