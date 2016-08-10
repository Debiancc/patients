module VirtualAttributes
  extend ActiveSupport::Concern

  def full_name
    "#{self.first_name}#{self.middle_name}#{self.last_name}"
  end

  def medical_record_number
    "MR#{'%06d' % self.id}"
  end

  def current_age
    return '' if self.birthday.nil?
    value = Time.now.year - self.birthday.year
    value = 0 if value < 0
    value
  end

end