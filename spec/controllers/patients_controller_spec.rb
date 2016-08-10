require 'rails_helper'

RSpec.describe PatientsController, type: :controller do

  let(:valid_attributes) { build(:patient).attributes.symbolize_keys }

  let(:invalid_attributes) { {first_name: '6'} }

  describe "GET #index" do
    it "assigns all patients as @patients" do
      patient = Patient.create! valid_attributes
      get :index, params: {}
      expect(assigns(:patients)).to eq([patient])
    end
  end

  # describe "GET #show" do
  #   it "assigns the requested patient as @patient" do
  #     patient = Patient.create! valid_attributes
  #     get :show, params: {id: patient.to_param}
  #     expect(assigns(:patient)).to eq(patient)
  #   end
  # end

  describe "GET #new" do
    it "assigns a new patient as @patient" do
      get :new, params: {}, xhr: true
      expect(assigns(:patient)).to be_a_new(Patient)
    end
  end

  describe "GET #edit" do
    it "assigns the requested patient as @patient" do
      patient = Patient.create! valid_attributes
      get :edit, params: {id: patient.to_param}, xhr: true
      expect(assigns(:patient)).to eq(patient)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Patient" do
        expect {
          post :create, params: {patient: valid_attributes}, xhr: true
        }.to change(Patient, :count).by(1)
      end

      it "assigns a newly created patient as @patient" do
        post :create, params: {patient: valid_attributes}, xhr: true
        expect(assigns(:patient)).to be_a(Patient)
        expect(assigns(:patient)).to be_persisted
      end

      it "redirects to the created patient" do
        post :create, params: {patient: valid_attributes}, xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved patient as @patient" do
        post :create, params: {patient: invalid_attributes}, xhr: true
        expect(assigns(:patient)).to be_a_new(Patient)
      end

      it "re-renders the 'new' template" do
        post :create, params: {patient: invalid_attributes}, xhr: true
        expect(response).to render_template("create")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {first_name: '6'} }

      it "updates the requested patient" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: new_attributes}, xhr: true
        patient.reload
        expect(assigns(:patient).attributes.symbolize_keys[:first_name]).to eq(new_attributes[:first_name])
      end

      it "assigns the requested patient as @patient" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: valid_attributes}, xhr: true
        expect(assigns(:patient)).to eq(patient)
      end

      it "redirects to the patient" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: valid_attributes}, xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid params" do
      it "assigns the patient as @patient" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: invalid_attributes}, xhr: true
        expect(assigns(:patient)).to eq(patient)
      end

      it "re-renders the 'edit' template" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: invalid_attributes}, xhr: true
        expect(response).to render_template("update")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested patient" do
      patient = Patient.create! valid_attributes
      expect {
        delete :destroy, params: {id: patient.to_param}, xhr: true
      }.to change(Patient, :count).by(-1)
    end

    it "redirects to the patients list" do
      patient = Patient.create! valid_attributes
      delete :destroy, params: {id: patient.to_param}, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

end
