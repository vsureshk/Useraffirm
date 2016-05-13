class EmployerMailer < ApplicationMailer
  default from: 'sureshtest1379@gmail.com'
  TWILIO_ACCOUNT_SID = 'ACee2750c4c060305afaa9bccc600a32a4'
  TWILIO_AUTH_TOKEN = '7ee4ddfa773a88be34840ed4c2e47a06'
  TWILIO_PHONE_NUMBER = '+19723189553'

    #Send email token
    def send_token(employer)
      @employer = employer
      @url  = 'http://example.com/login'
      mail(to: @employer.email, subject: 'Welcome to My Awesome Site')
      send_mobile_token(employer)
    end

    #Send Mobile token
    def send_mobile_token(employer)
      begin
        phone = "+91#{employer.phone_number}"
        @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
        message = @client.account.messages.create(:body => "Token - #{employer.mobile_token}",
        :to => phone,
        :from => TWILIO_PHONE_NUMBER)
      rescue Twilio::REST::RequestError => e
        puts e.message
      end
    end
end
