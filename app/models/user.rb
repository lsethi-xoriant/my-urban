class User < ActiveRecord::Base
	validates :first_name, presence: {message: "can't be blank!!!"}
	validates :first_name, allow_blank: true, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
	  message: "only allows letters" }
	validates_presence_of :last_name
	validates :last_name, allow_blank: true, format: { with: /\A[a-zA-Zа-яА-Я]+\z/,
	  message: "only allows letters" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
