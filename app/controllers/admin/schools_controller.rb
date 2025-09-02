class Admin::SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to admin_schools_path, notice: "添加学校 #{@school.school_name} 成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to admin_school_path(@school)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to admin_schools_path, notice: "成功删除学校"
  end

  private

  def school_params
    params.require(:school).permit(:school_name)
  end
end
