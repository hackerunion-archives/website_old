class Event < ActiveRecord::Base
  belongs_to :member
  validate :starts_before_ends?

  def approve!
    self.approved = true
    save!
  end

  def starts_before_ends?
    errors.add(:base, 'Event must end after it starts') unless self.starts < self.ends
  end
  
end
