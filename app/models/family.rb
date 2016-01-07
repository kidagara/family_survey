class Family < ActiveRecord::Base

  belongs_to :user

  validates :employee_relative,
            :household_name, presence: true

end
