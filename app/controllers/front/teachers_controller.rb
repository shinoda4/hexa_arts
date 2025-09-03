class Front::TeachersController < ApplicationController
  def index
    if params[:major_id].present?
      @major = Major.find(params[:major_id])
      @teachers = @major.teachers
    else
      @teachers = Teacher.all
    end
    render :'front/teachers/index'
  end


  def show
    @teacher = Teacher.find(params[:id])
    render :'front/teachers/show'
  end
end
