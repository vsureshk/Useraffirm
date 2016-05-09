class UserVerifyController < ApplicationController
  def index
  end

  def new

  end

  def create
    @employer = Employer.new(employer_params)
    @employer.save
    #redirect_to @employer
    EmployerMailer.verify_email(@employer).deliver_later
    render plain: params[:employer].inspect
  end

  private
  def employer_params
    params.require(:employer).permit(:name, :email)
  end
end
