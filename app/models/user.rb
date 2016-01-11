class User < ActiveRecord::Base
  include Authentication
  rolify

  has_many :families

  validates :uid,
            :provider,
            :first_name,
            :last_name,
            :email, presence: true

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@wavetronix\.com\z/,
                  message: "must be a wavetronix.com account" }

  def name
    %W[#{first_name} #{last_name}].join(" ")
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
