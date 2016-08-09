require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:patient) { build(:patient) }

  it 'has a valid factory' do
    expect(patient).to be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:status) }
    it { should validate_length_of(:first_name).is_at_most(30) }
    it { should validate_length_of(:last_name).is_at_most(30) }
    it { should validate_length_of(:middle_name).is_at_most(10) }
    it { should define_enum_for(:status).with %w(initial referred treatment closed) }
    it { should define_enum_for(:gender).with %w(no_available male female) }
  end

  describe 'relation' do
    it { should belong_to(:location) }
  end

  describe '#fullname' do
    it 'return full name' do
      expect(build(:patient, first_name: '1', middle_name: nil, last_name: '2').full_name).to eq '12'
    end

    it 'has middle name' do
      expect(build(:patient, first_name: '1', middle_name: '2', last_name: '3').full_name).to eq '123'
    end
  end

  describe '#medical_record_number' do
    it 'return mr number' do
      expect(build(:patient, id: 666).medical_record_number).to eq 'MR000666'
    end

    it 'when id is bigger' do
      expect(build(:patient, id: 1000000).medical_record_number).to eq 'MR1000000'
    end
  end

  describe '#current_age' do
    it 'return current age' do
      expect(build(:patient, birthday: 50.years.ago).current_age).to eq 50
    end

    it 'when break index' do
      expect(build(:patient, birthday: 50.years.since).current_age).to eq 0
    end
  end

end
