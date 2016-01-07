class FamiliesController < ApplicationController
  before_action :find_family

  def index
    @families = Family.all
  end

  def new
    @family = Family.new
  end

  def edit
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to family_path, notice: %(Updated "#{@family.last_name}" successfully.)
    else
      render :new
    end
  end

  def update
    if @family.update(family_params)
      redirect_to family_path, notice: %(Updated "#{@family.last_name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    @family.destroy
    redirect_to root_path
  end

  private

  def find_family
    @family = Family.find(params[:id]) if params[:id]
  end

  def family_params
    params.require(:family).permit(:employee_first_name, :employee_email, :partner_first_name, :decendents_under2, :decendents_2to5, :decendents_6to12, :decendents_13to17, :decendents_over18)
  end

end
