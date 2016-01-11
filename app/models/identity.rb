class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :first_name,
            :last_name, presence: true
  validates :password,
            :password_confirmation, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\b[A-Z0-9._%a-z\-]+@wavetronix\.com\z/,
                  message: "must be a wavetronix.com account" }

  after_destroy :delete_user

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Identity.exists?(column => self[column])
  end

  def delete_user
    user = User.find_by(uid: id)
    user.destroy
  end

  def update_user
    user = User.find_by(uid: id)
    user.first_name = first_name
    user.last_name = last_name
    user.email = email
    user.save
  end

end
