class User < ActiveRecord::Base
  has_many :events, dependent: :destroy

  has_many :plans, :foreign_key => :member_id
  has_many :measures, through: :plans, source: :measure

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :follower_friendships, -> { where status: 'follower' }, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :followers, :through => :follower_friendships, :source => :user

  has_many :followed_friendships, -> { where status: 'follower' }, :class_name => "Friendship"
  has_many :followed_users, :through => :followed_friendships, :source => :friend

  validates :first_name, presence: {message: "can't be blank!!!"}
  validates :first_name, allow_blank: true, format: { with: /\A[a-zA-Zа-яА-ЯіІїЇєЄ]+\z/,
    message: "only allows letters" }
  validates_presence_of :last_name
  validates :last_name, allow_blank: true, format: { with: /\A[a-zA-Zа-яА-ЯіІїЇєЄ]+\z/,
    message: "only allows letters" }
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def requests
    inverse_friendships.where(status: 'request')
  end

  def user_follower(user_id)
    follower_friendships.where(user_id: user_id).first
  end
=begin
  def followers
    inverse_friendships.where(status: 'follower')
  end
=end

  def user_friends
    friendships.where(status: 'friend') + inverse_friendships.where(status: 'friend')
  end
end
