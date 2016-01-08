class Family < ActiveRecord::Base

  belongs_to :user

  validates :user_id,
            :family_name,
            :members_over18, presence: true

  def total_family_members
    total = 0
    total += members_under2 if members_under2
    total += members_2to5 if members_2to5
    total += members_6to12 if members_6to12
    total += members_13to17 if members_13to17
    total += members_over18 if members_over18
    return total
  end

end
