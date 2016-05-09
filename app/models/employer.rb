class Employer < ActiveRecord::Base
  before_create :generate_token, unless: :token?

  protected

    def generate_token
      self.token = SecureRandom.hex(3)
    end
end
