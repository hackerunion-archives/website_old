class Member < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :trackable,
         :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :name, :approved, :admin, :whyhacker, :city

  has_and_belongs_to_many :affiliations

  has_and_belongs_to_many :skills
  has_many :events

  ransackable_associations :affiliations
  ransackable_associations :skills

  def approve!
    self.approved = true
    save!
  end

  def self.find_for_github_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    if member = Member.where(:email => data["email"]).first
      member
    else
      Member.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :name => data["name"])
    end
  end

end
