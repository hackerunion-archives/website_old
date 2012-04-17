class Member < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :name, :affiliation_list,
                  :pending, :admin

  has_and_belongs_to_many :affiliations

  def approve!
    self.pending = false
    save!
  end

end
