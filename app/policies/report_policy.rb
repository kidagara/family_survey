class ReportPolicy < ApplicationPolicy
  def index?
    user && user.has_role?(:admin)
  end

  def show?
    user && user.has_role?(:admin)
  end

end
