class User < ActiveRecord::Base
  belongs_to :avatar
  belongs_to :background, :class_name => 'Avatar', :foreign_key => "background_id"
  has_many :events, dependent: :destroy
  has_many :comments, :dependent => :destroy

  has_many :plans, :foreign_key => :member_id, dependent: :destroy
  has_many :measures, through: :plans, source: :measure

  has_many :intents, -> { where('status =? OR status = ? OR status = ?', 'come', 'turn', 'invite') }, :class_name => "Plan", :foreign_key => :member_id
  has_many :intent_measures, through: :intents, source: :measure
  has_many :user_measures, -> { where(plans: {status: 'come'}) }, through: :plans, source: :measure
  has_many :user_turns, -> { where(plans: {status: 'turn'}) }, through: :plans, source: :measure
  has_many :intent_invites, -> { where(plans: {status: 'invite'}) }, through: :plans, source: :measure

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :follower_friendships, -> { where status: 'follower' }, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :followers, :through => :follower_friendships, :source => :user

  has_many :followed_friendships, -> { where status: 'follower' }, :class_name => "Friendship"
  has_many :followed_users, :through => :followed_friendships, :source => :friend

  has_many :active_friends, -> { where(friendships: { status: 'friend'}) }, :through => :friendships, :source => :friend 
  has_many :passive_friends, -> { where(friendships: { status: 'friend'}) }, :through => :inverse_friendships, :source => :user


  

  validates :first_name, presence: {message: I18n.t('activerecord.errors.models.user.attributes.first_name.presence')}
  validates :first_name, allow_blank: true, format: { with: /\A[a-zA-Zа-яА-ЯіІїЇєЄ]+\z/,
    message: "only allows letters" }
  validates_presence_of :last_name
  validates :last_name, allow_blank: true, format: { with: /\A[a-zA-Zа-яА-ЯіІїЇєЄ]+\z/,
    message: "only allows letters" }
  validates_presence_of :gender, :birthday#, :password_confirmation 
  #validates_presence_of :city
  belongs_to :city
  #validates_associated :city

  before_validation :ensure_than_city_exists
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.user_gender
    [[I18n.t('registration.man'), 'man'], [I18n.t('registration.woman'), 'woman']]
  end


  def ensure_than_city_exists
    unless City.where(en_name: self.urban).exists?
      self.errors[:urban] << I18n.t('my_errors.messages.incorrect_city')
    else
      city = City.where(en_name: self.urban).first
      self.city_id = city.id
    end
  end

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

  def come(event)
    return true if plans.where(measure_id: event, status: 'come').all.count == 1
    #puts "HHHHHHHHHH  #{event} #{plans.where(measure_id: event).all.count}"
    return false if plans.where(measure_id: event, status: 'come').all.count == 0
  end

  def in_turn(event_id)
    return true if plans.where(status: 'turn', measure_id: event_id).exists?
    return false unless plans.where(status: 'turn', measure_id: event_id).exists?
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

  def user_friends
    active_friends | passive_friends
  end

  def user_invites
    plans.where(status: 'invite')
  end

  def are_participation(event_id)
    plans.where('measure_id = ? AND (status =? OR status = ? OR status = ?)', event_id, 'come', 'turn', 'invite').exists?  ? true : false 
  end
end
