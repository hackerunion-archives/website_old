class Member < ActiveRecord::Base

  has_and_belongs_to_many :affiliations

  def approve!
    self.pending = false
    save!
  end

end
