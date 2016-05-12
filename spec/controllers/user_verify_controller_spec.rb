require 'rails_helper'


RSpec.describe UserVerifyController, type: :controller do

  let(:valid_attributes) {
      {name: "suresh", email: "sureshtest1379@gmail.com", dob: "2011-05-12", gender: "M", location: "chennai", phone_number: "9944838117", email_verified: true, mobile_verified: false}
    }

    let(:invalid_attributes) {
      {name: " "}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "assigns all employers as @employers" do
        employer = Employer.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:employers)).to eq([employer])
      end
    end

    describe "GET #show" do
      it "assigns the requested employer as @employer" do
        employer = Employer.create! valid_attributes
        get :show, {:id => employer.to_param}, valid_session
        expect(assigns(:employer)).to eq(employer)
      end
    end


    describe "GET #new" do
      it "assigns a new employer as @employer" do
        get :new, {}, valid_session
        expect(assigns(:employer)).to be_a_new(Employer)
      end
    end

    describe "GET #edit" do
      it "assigns the requested employer as @employer" do
        employer = Employer.create! valid_attributes
        get :edit, {:id => employer.to_param}, valid_session
        expect(assigns(:employer)).to eq(employer)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Employer" do
          expect {
            post :create, {:employer => valid_attributes}, valid_session
          }.to change(Employer, :count).by(1)
        end

        it "assigns a newly created employer as @employer" do
          post :create, {:employer => valid_attributes}, valid_session
          expect(assigns(:employer)).to be_a(Employer)
          expect(assigns(:employer)).to be_persisted
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved employer as @employer" do
          post :create, {:employer => invalid_attributes}, valid_session
          expect(assigns(:employer)).to be_a_new(Employer)
        end

        it "re-renders the 'new' template" do
          post :create, {:employer => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end


    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {name: "suresh", email: "vsureshk321@gmail.com", dob: "2011-05-12", gender: "M", location: "chennai", phone_number: "9944838117", email_verified: true, mobile_verified: false}
        }

        it "assigns the requested employer as @employer" do
          employer = Employer.create! valid_attributes
          put :update, {:id => employer.to_param, :employer => valid_attributes}, valid_session
          expect(assigns(:employer)).to eq(employer)
        end

      end

      context "with invalid params" do
        it "assigns the employer as @employer" do
          employer = Employer.create! valid_attributes
          put :update, {:id => employer.to_param, :employer => invalid_attributes}, valid_session
          expect(assigns(:employer)).to eq(employer)
        end

      end
    end

end
