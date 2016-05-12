require 'rails_helper'

RSpec.describe "UserVerify", type: :request do
  describe "GET /user_verify/index" do
    it "index page" do
      get user_verify_index_path
      expect(response).to have_http_status(200)
    end
  end
end
