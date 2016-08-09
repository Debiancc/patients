require 'rails_helper'
RSpec.describe Location, type: :model do
  let(:location) { build(:location) }
  it 'has a valid factory' do
    expect(location).to be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(80) }
    it { should validate_length_of(:code).is_at_most(10) }
  end

  describe 'relation' do
    it { should have_many(:patients) }
  end

end
