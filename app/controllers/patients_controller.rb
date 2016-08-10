class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy]
  before_action :counter, only: [:edit]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
  end

  def update
    @patient.update(patient_params)
  end

  def destroy
    @patient.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def counter
    Patient.increment_counter(:viewed_count, @patient.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit(:first_name, :middle_name, :last_name, :location_id, :birthday, :gender, :status)
  end
end
