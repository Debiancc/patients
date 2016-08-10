require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  let(:valid_attributes) { build(:location).attributes.symbolize_keys }

  describe "GET #show" do
    it "assigns the requested location as @location" do
      location = Location.create! valid_attributes
      get :show, params: {id: location.to_param}
      expect(assigns(:location)).to eq(location)
    end
  end

end
