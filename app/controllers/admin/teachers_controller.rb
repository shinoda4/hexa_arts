class Admin::TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      q = "%#{params[:query]}%"
      @teachers = Teacher.where("name LIKE ? OR position LIKE ?", q, q)
    else
      @teachers = Teacher.all
    end
  end


  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teachers_path, notice: "成功创建教师 #{@teacher.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher), notice: "成功修改教师 #{@teacher.name}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy
    redirect_to admin_teachers_path, notice: "成功删除教师 #{@teacher.name}"
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(
      :name, :gender, :position, :award_certificates, :honors, :teacher_license,
      :bio, :experience, :phone, :wechat, :school_id, :major_id, :education_id, :photo,
      )
  end
end
