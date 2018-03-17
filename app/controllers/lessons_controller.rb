class LessonsController < ApplicationController

  def show
    current_lesson
  end


  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
