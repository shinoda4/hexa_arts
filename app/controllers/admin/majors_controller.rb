class Admin::MajorsController < ApplicationController
  def index
    @majors = Major.all
  end

  def show
    @major = Major.find(params[:id])
  end

  def new
    @major = Major.new
  end

  def create
    @major = Major.new(majors_params)
    if @major.save
      redirect_to admin_majors_path, notice: "成功创建专业"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @major = Major.find(params[:id])
  end

  def update
    @major = Major.find(params[:id])
    if @major.update(majors_params)
      redirect_to admin_major_path(@major), notice: "成功修改专业"
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @major = Major.find(params[:id])
    @major.destroy
    redirect_to admin_majors_path, notice: "成功删除专业"
  end

  private

  def majors_params
    params.require(:major).permit(:major_name)
  end
end
