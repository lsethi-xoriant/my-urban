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

  def comming(event)
    return true if plans.where(measure_id: event, status: 'comming').all.count == 1
    #puts "HHHHHHHHHH  #{event} #{plans.where(measure_id: event).all.count}"
    return false if plans.where(measure_id: event, status: 'comming').all.count == 0
  end

  def confirm_friend(user_id)
    return true if (friendships.where(status: 'friend').where("user_id = ? OR friend_id = ?", user_id, user_id) + inverse_friendships.where(status: 'friend').where("user_id = ? OR friend_id = ?", user_id, user_id)).count == 1
    return false if (friendships.where(status: 'friend').where("user_id = ? OR friend_id = ?", user_id, user_id) + inverse_friendships.where(status: 'friend').where("user_id = ? OR friend_id = ?", user_id, user_id)).count == 0
  end


  def user_friendships
    friendships.where(status: 'friend') + inverse_friendships.where(status: 'friend')
  end

  def user_friend(friendship)
    @user = nil
    if friendship.user_id == self.id
      @user = friendship.friend
    elsif friendship.friend_id == self.id
      @user = friendship.user
    end
    return @user
  end

  def user_invites
    plans.where(status: 'invite')
  end
end
