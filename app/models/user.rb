class User < ActiveRecord::Base
  rolify
  has_one :user_profile, dependent: :destroy
  has_many :user_business_profiles
  has_many :business_profiles, through: :user_business_profiles
  has_many :posts, dependent: :destroy
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  acts_as_voter

  # extend FriendlyId
  # friendly_id :name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :assign_default_role

  def assign_default_role
  	self.add_role :user
  end



  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end
end
