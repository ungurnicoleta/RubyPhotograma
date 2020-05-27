class User < ApplicationRecord
  rolify
  has_many :photo_projects
  has_one :photographer


  accepts_nested_attributes_for :photographer

  # follower_follows "names" the Follow join table for accessing through the follower association
  has_many :follower_follows, foreign_key: :followee_id, class_name: 'Follow'
  # source: :follower matches with the belong_to :follower identification in the Follow model
  has_many :followers, through: :follower_follows, source: :follower

  # followee_follows "names" the Follow join table for accessing through the followee association
  has_many :followee_follows, foreign_key: :follower_id, class_name: 'Follow'
  # source: :followee matches with the belong_to :followee identification in the Follow model
  has_many :followees, through: :followee_follows, source: :followee

  mount_uploader :avatar, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  def followers_with_user
    { user_id: id, followers: followers }
  end

  def followees_with_user
    { user_id: id, followees: followees }
  end

  def a_follower?(followee)
    followees.include? followee
  end

  def follow(user_id)
    followee_follows.create(followee_id: user_id)
  end

  def unfollow(user_id)
    followee_follows.find_by(followee_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, followee_id: user_id)
    true if relationship
  end

end
