class Admin::EducationsController < ApplicationController
  def index
    @educations = Education.all
  end

  def show
    @education = Education.find(params[:id])
  end

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    if @education.save
      redirect_to admin_educations_path, notice: "成功创建学历类型"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update(education_params)
      redirect_to admin_education_path(@education), notice: "成功修改学历类型"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_to admin_educations_path, notice: "成功删除学历类型"
  end

  private

  def education_params
    params.require(:education).permit(:education_name)
  end
end
