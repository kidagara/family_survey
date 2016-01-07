class IdentitiesController < ApplicationController
  skip_before_action :authenticate!, only: [:new]
  before_action :find_identity

  def show
  end

  def new
    @identity = env["omniauth.identity"]
  end

  def edit
  end

  def update
    if @identity.update(identity_params)
      @identity.update_user
      redirect_to users_path, notice: %(Updated "#{@identity.first_name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    @identity.destroy
    redirect_to sign_in_path
  end

  def authentication_failure
    redirect_to sign_in_path, alert: params[:message].humanize
  end

  private

  def identity_params
    params.require(:identity).permit(:first_name, :last_name, :email, :id, :auth_token, :provider)
  end

  def find_identity
    @identity = Identity.find(params[:id]) if params[:id]
  end

end
