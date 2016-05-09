class EmployerMailer < ApplicationMailer
  default from: 'vsureshk321@gmail.com'

    def verify_email(employer)
      @employer = employer
      @url  = 'http://example.com/login'
      mail(to: @employer.email, subject: 'Welcome to My Awesome Site')
    end
end
