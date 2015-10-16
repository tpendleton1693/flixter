class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_in_course
  def show
  end

  private

  def require_enrollment_in_course
    unless current_user.enrolled_in?(current_lesson.section.course)
      redirect_to :back, alert: 'You must be enrolled in the course to view lessons'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
