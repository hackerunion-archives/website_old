class Member < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :trackable,
         :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :name, :approved, :admin

  has_and_belongs_to_many :affiliations

  has_and_belongs_to_many :skills
  has_many :events

  ransackable_associations :affiliations
  ransackable_associations :skills

  def approve!
    self.approved = true
    save!
  end

end
