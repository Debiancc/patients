require 'rails_helper'

RSpec.describe "Patients", type: :feature, js: true do
  def get_index
    visit patients_path
    expect(page).to have_http_status(200)
    expect(page).to have_content('New Patient')
    expect(page).to have_selector('tr', count: 1)
  end

  def create_patient
    click_link('New Patient')
    expect(page).to have_http_status(200)
    within('#new_patient') do
      fill_in('patient[first_name]', with: '1')
      fill_in('patient[middle_name]', with: '2')
      fill_in('patient[last_name]', with: '3')
      find('.btn').trigger('click')
    end
    expect(page).to have_content('123')
  end

  def update_patient
    click_link('MR000001')
    expect(page).to have_http_status(200)
    within('#edit_patient_1') do
      fill_in('patient[first_name]', with: '11')
      fill_in('patient[middle_name]', with: '22')
      fill_in('patient[last_name]', with: '33')
      find('.btn').trigger('click')
    end
    expect(page).to have_content('112233')
  end

  def validate_location
    click_link(@location.name)
    expect(page).to have_content('112233')
  end

  def destroy
    click_link 'Destroy'
    page.accept_alert
    expect(page).to have_http_status(200)
  end


  before(:each) do
    @location = create :location
  end
  describe "the patient process" do
    it do
      get_index
      create_patient
      update_patient
      validate_location
      destroy
      get_index
    end
  end
end
