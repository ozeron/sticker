# Class for managing API AUTH
class AccessProvider < ActiveRecord::Base
  belongs_to :user
  before_create :gen_tokens

  def self.authenticate(**credentials)
    return nil unless User.check_credentials(credentials)
    create_for_user(User.find_by_login(credentials[:login]))
  end
  # TODO: ensure USER not logged_in
  def self.create_for_user(user)
    create user: user
  end

  private

  def gen_tokens
    self.code = SecureRandom.hex(16)
    self.access_token = SecureRandom.hex(16)
    self.refresh_token = SecureRandom.hex(16)
  end
end
