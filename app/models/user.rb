class User < ActiveRecord::Base
  include Authentication
  rolify

  has_many :families

  validates :uid,
            :provider,
            :first_name,
            :last_name,
            :email, presence: true

  def name
    %W[#{first_name} #{last_name}].join(" ")
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
