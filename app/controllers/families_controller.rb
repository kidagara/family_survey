class FamiliesController < ApplicationController
  before_action :find_family

  def index
    families
  end

  def new
    @family = Family.new
    @family.user_id = current_user.id
  end

  def edit
  end

  def create
    @family = Family.new(family_params)
    @family.user_id = current_user.id if current_user
    if @family.save
      redirect_to families_path, notice: %(Updated "#{@family.family_name}" successfully.)
    else
      render :new
    end
  end

  def update
    if family.update(family_params)
      redirect_to families_path, notice: %(Updated "#{@family.family_name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    family.destroy
    redirect_to families_path
  end

  private

  def families
    if current_user.has_role?(:admin)
      @families = Family.all
      # but listed in order by user_id user last name
    else
      @families ||= current_user.families
    end
  end

  def family
    @family ||= current_user.families.find(params[:id])
  end

  def find_family
    @family = Family.find(params[:id]) if params[:id]
  end

  def family_params
    params.require(:family).permit(:user_id, :family_name, :members_under2, :members_2to5, :members_6to12, :members_13to17, :members_over18)
  end

end
