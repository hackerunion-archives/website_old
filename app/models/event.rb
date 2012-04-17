class Event < ActiveRecord::Base
  belongs_to :member

  def approve!
    self.approved = true
    save!
  end
  
end
