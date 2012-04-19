class Announcement < ActiveRecord::Base
  belongs_to :member

  scope :approved, where(approved: true)
  scope :not_approved, where(approved: false)
  scope :latest, lambda { |count|
    approved.order('created_at desc').limit(count)
  }

  def approve!
    self.approved = true
    save!
  end
  
end
