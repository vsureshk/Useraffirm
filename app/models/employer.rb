class Employer < ActiveRecord::Base
  validates :name, :email, :phone_number, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Provide a valid email address" }
  validates :email_token, uniqueness: true

  before_create :generate_token, unless: [:email_token?, :mobile_token?]

  protected
    #Generate email and mobile token
    def generate_token
      self.email_token = SecureRandom.hex(3)
      self.mobile_token = SecureRandom.hex(3)
    end
end
