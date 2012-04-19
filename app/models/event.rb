class Event < ActiveRecord::Base
  belongs_to :member
  validate :starts_before_ends?

  scope :approved, where(approved: true)
  scope :not_approved, where(approved: false)
  scope :upcoming, lambda {|count| approved.where('starts > ?', DateTime.now).order('starts asc').limit(count)}

  def approve!
    self.approved = true
    save!
  end

  def starts_before_ends?
    errors.add(:base, 'Event must end after it starts') unless self.starts < self.ends
  end
  
end
