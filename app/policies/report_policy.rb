class ReportPolicy < ApplicationPolicy
  def index?
    user && user.has_role?(:admin)
  end

end
