class UserVerifyController < ApplicationController

  #All Employers list
  def index
    @employers = Employer.all
  end

  #Employer Register
  def new
    @employer = Employer.new
  end

  #create Employer
  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      EmployerMailer.send_token(@employer).deliver_later
      redirect_to user_verify_url(@employer)
    else
      render 'new'
    end
  end

  #Edit Employer
  def edit
    @employer = Employer.find(params[:id])
  end

  #Show Employer
  def show
    @employer = Employer.find(params[:id])
  end

  #Set Employer email or mobile number as Unverified
  def update
    @employer = Employer.find(params[:id])
    if @employer.email != params[:employer][:email]
      @employer.update_attributes(email_verified: false, name: params[:employer][:name], email: params[:employer][:email], dob: params[:employer][:dob], gender: params[:employer][:gender], location: params[:employer][:location], phone_number: params[:employer][:phone_number])
      EmployerMailer.send_token(@employer).deliver_later
      redirect_to user_verify_url(@employer)
    elsif @employer.phone_number != params[:employer][:phone_number]
      @employer.update_attributes(mobile_verified: false, name: params[:employer][:name], email: params[:employer][:email], dob: params[:employer][:dob], gender: params[:employer][:gender], location: params[:employer][:location], phone_number: params[:employer][:phone_number])
      EmployerMailer.send_token(@employer).deliver_later
      redirect_to user_verify_url(@employer)
    elsif @employer.update_attributes(employer_params)
      redirect_to user_verify_url(@employer)
    else
      render 'edit'
    end
  end

  #Email verification
  def email_verify
    @employer = Employer.find(params[:id])
    if params[:email].present?
      if @employer.email_token == params[:email] && @employer.email_verified
        @employer.errors.add(:base, "Oops Your Email Token already verified !!")
        render 'show'
      elsif @employer.email_token == params[:email]
        @employer.update_attributes(email_verified: true)
        redirect_to user_verify_url(@employer)
      else
        @employer.errors.add(:base, "Please Input a valid email token")
        render 'show'
      end
    else
      redirect_to user_verify_url(@employer)
    end
  end

  #Mobile number verification
  def mobile_verify
    @employer = Employer.find(params[:id])
    if params[:phone].present?
      if @employer.mobile_token == params[:phone] && @employer.mobile_verified
        @employer.errors.add(:base, "Oops Your Mobile Token already verified !!")
        render 'show'
      elsif @employer.mobile_token == params[:phone]
        @employer.update_attributes(mobile_verified: true)
        redirect_to user_verify_url(@employer)
      else
        @employer.errors.add(:base, "Please Input a valid mobile token")
        render 'show'
      end
    else
      redirect_to user_verify_url(@employer)
    end
  end

  private
    def employer_params
      params.require(:employer).permit(:name, :email, :dob, :gender, :location, :phone_number, :email_verified, :mobile_verified)
    end
end
