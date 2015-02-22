class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :access_provider

  scope :find_by_login, ->(email) { where(email: email).first }

  def self.check_credentials(login:, password:)
    User.find_by_login(login).valid_password?(password)
  end

end
