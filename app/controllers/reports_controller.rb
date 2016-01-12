class ReportsController < ApplicationController
  before_action :find_family, :find_user

  def index
    @families = Family.order("family_name ASC").all
    @users = User.order("last_name, first_name ASC").all
    authorize :report
  end

  private

  def find_family
    @family = Family.find(params[:id]) if params[:id]
  end

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end

end
